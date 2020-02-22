# -*- coding: utf-8 -*-

"""Upsampling module.

This code is modified from https://github.com/r9y9/wavenet_vocoder.

"""

import numpy as np
import tensorflow as tf
#import torch.nn.functional as F

from tensorflow.keras.layers import Conv1D


class Stretch2d(tf.keras.layers.UpSampling2D):
    """Stretch2d module."""

    def __init__(self, x_scale, y_scale, mode="nearest"):
        """Initialize Stretch2d module.

        Args:
            x_scale (int): X scaling factor (Time axis in spectrogram).
            y_scale (int): Y scaling factor (Frequency axis in spectrogram).
            mode (str): Interpolation mode.

        """
        super(Stretch2d, self).__init__(size=(x_scale, y_scale), data_format = "channels_first", interpolation=mode)
        self.x_scale = x_scale
        self.y_scale = y_scale
        self.mode = mode

    '''
    def call(self, x):
        Calculate forward propagation.

        Args:
            x (Tensor): Input tensor (B, C, F, T).

        Returns:
            Tensor: Interpolated tensor (B, C, F * y_scale, T * x_scale),
 
        return F.interpolate(# upsampling
            x, scale_factor=(self.y_scale, self.x_scale), mode=self.mode)
    '''

class Conv2D(tf.keras.layers.Conv2D):
    """Conv2D module with customized initialization."""

    def __init__(self, *args, **kwargs):
        """Initialize Conv2d module."""
        super(Conv2D, self).__init__(*args, **kwargs)

    '''
    def reset_parameters(self):
        """Reset parameters."""
        self.weight.data.fill_(1. / np.prod(self.kernel_size))
        if self.bias is not None:
            torch.nn.init.constant_(self.bias, 0.0)
    '''


class UpsampleNetwork(tf.keras.layers.Layer):
    """Upsampling network module."""

    def __init__(self,
                 upsample_scales,
                 upsample_activation="none",
                 upsample_activation_params={},
                 mode="nearest",
                 freq_axis_kernel_size=1,
                 use_causal_conv=False,
                 ):
        """Initialize upsampling network module.

        Args:
            upsample_scales (list): List of upsampling scales.
            upsample_activation (str): Activation function name.
            upsample_activation_params (dict): Arguments for specified activation function.
            mode (str): Interpolation mode.
            freq_axis_kernel_size (int): Kernel size in the direction of frequency axis.

        """
        super(UpsampleNetwork, self).__init__()
        self.use_causal_conv = use_causal_conv
        self.up_layers = list()
        for scale in upsample_scales:
            # interpolation layer
            stretch = Stretch2d(scale, 1, mode)
            self.up_layers += [stretch]

            # conv layer
            assert (freq_axis_kernel_size - 1) % 2 == 0, "Not support even number freq axis kernel size."
            freq_axis_padding = (freq_axis_kernel_size - 1) // 2
            kernel_size = (freq_axis_kernel_size, scale * 2 + 1)
            if use_causal_conv:
                padding = "same"
                # [TORCH] padding = "causal"    NOTE: TF2 Conv2D layer does not support causal padding
                # [TORCH] padding = (freq_axis_padding, scale * 2)
            else:
                padding = "same"
                # [TORCH] padding = (freq_axis_padding, scale)
            conv = Conv2D(filters=1, kernel_size=kernel_size, padding=padding, use_bias=False)
            # [TORCH] conv = Conv2D(1, 1, kernel_size=kernel_size, padding=padding, bias=False)
            self.up_layers += [conv]

            # nonlinear
            if upsample_activation != "none":
                # NOTE: upsample_activation is always "none".
                nonlinear = getattr(tf.keras.layer, upsample_activation)(**upsample_activation_params)
                self.up_layers += [nonlinear]

    def call(self, c):
        """Calculate forward propagation.

        Args:
            c : Input tensor (B, C, T).

        Returns:
            Tensor: Upsampled tensor (B, C, T'), where T' = T * prod(upsample_scales).

        """
        c = tf.expand_dims(c, 1)
        # [TORCH] c = c.unsqueeze(1)  # (B, 1, C, T)
        for f in self.up_layers:
            if self.use_causal_conv and isinstance(f, Conv2D):
                c = f(c)[..., :int(c.get_shape()[-1])]
                # [TORCH] c = f(c)[..., :c.size(-1)]
            else:
                c = f(c)
        return tf.squeeze(c, [1,])
        # [TORCH] return c.squeeze(1)  # (B, C, T')


class ConvInUpsampleNetwork(tf.keras.layers.Layer):
    """Convolution + upsampling network module."""

    def __init__(self,
                 upsample_scales,
                 upsample_activation="none",
                 upsample_activation_params={},
                 mode="nearest",
                 freq_axis_kernel_size=1,
                 aux_channels=80,
                 aux_context_window=0,
                 use_causal_conv=False
                 ):
        """Initialize convolution + upsampling network module.

        Args:
            upsample_scales (list): List of upsampling scales.
            upsample_activation (str): Activation function name.
            upsample_activation_params (dict): Arguments for specified activation function.
            mode (str): Interpolation mode.
            freq_axis_kernel_size (int): Kernel size in the direction of frequency axis.
            aux_channels (int): Number of channels of pre-convolutional layer.
            aux_context_window (int): Context window size of the pre-convolutional layer.
            use_causal_conv (bool): Whether to use causal structure.

        """
        super(ConvInUpsampleNetwork, self).__init__()
        self.aux_context_window = aux_context_window
        self.use_causal_conv = use_causal_conv and aux_context_window > 0
        # To capture wide-context information in conditional features
        kernel_size = aux_context_window + 1 if use_causal_conv else 2 * aux_context_window + 1
        # NOTE(kan-bayashi): Here do not use padding because the input is already padded
        self.conv_in = Conv1D(filters=aux_channels, kernel_size=kernel_size, bias=False)
        # [TORCH] self.conv_in = Conv1D(aux_channels, aux_channels, kernel_size=kernel_size, bias=False)
        self.upsample = UpsampleNetwork(
            upsample_scales=upsample_scales,
            upsample_activation=upsample_activation,
            upsample_activation_params=upsample_activation_params,
            mode=mode,
            freq_axis_kernel_size=freq_axis_kernel_size,
            use_causal_conv=use_causal_conv,
        )

    def call(self, c):
        """Calculate forward propagation.

        Args:
            c : Input tensor (B, C, T').

        Returns:
            Tensor: Upsampled tensor (B, C, T),
                where T = (T' - aux_context_window * 2) * prod(upsample_scales).

        Note:
            The length of inputs considers the context window size.

        """
        c_ = self.conv_in(c)
        c = c_[:, :, :-self.aux_context_window] if self.use_causal_conv else c_
        return self.upsample(c)
