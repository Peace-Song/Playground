# -*- coding: utf-8 -*-

import math

import tensorflow as tf
from tensorflow.keras.layers import Conv1D, Dropout

'''
class conv1d(tf.nn.conv1D):
    """conv1d module with customized initialization."""

    def __init__(self, *args, **kwargs):
        """Initialize conv1d module."""
        super(conv1d, self).__init__(*args, **kwargs)

    def reset_parameters(self):
        pass
'''

class Conv1D1x1(Conv1D):
    """1x1 conv1d with customized initialization."""

    def __init__(self, in_channels, out_channels, bias):
        """Initialize Conv1d module."""
        
        super(Conv1D1x1, self).__init__(filters=out_channels, kernel_size=1, padding="valid",
                                        dilation_rate=1, use_bias=bias)


class ResidualBlock(tf.keras.layers.Layer):

    def __init__(self,
                kernel_size=3,
                residual_channels=64,
                gate_channels=128,
                skip_channels=64,
                aux_channels=80,
                dropout=0.0,
                padding=None,
                dilation=1,
                bias=True,
                use_causal_conv=False,
                ):
        """Initialize ResidualBlock module.

        Args:
            kernel_size (int): Kernel size of dilation convolution layer.
            residual_channels (int): Number of channels for residual connection.
            skip_channels (int): Number of channels for skip connection.
            aux_channels (int): Local conditioning channels i.e. auxiliary input dimension.
            dropout (float): Dropout probability.
            padding (int): Padding for convolution layers. If None, proper padding is
                computed depends on dilation and kernel_size.
            dilation (int): Dilation factor.
            bias (bool): Whether to add bias parameter in convolution layers.
            use_causal_conv (bool): Whether to use use_causal_conv or non-use_causal_conv convolution.

        """
        super(ResidualBlock, self).__init__()
        self.dropout = dropout
        """
        if padding is None:
            # no future time stamps available
            if use_causal_conv:
                padding = (kernel_size - 1) * dilation
            else:
                assert (kernel_size - 1) % 2 == 0, "Not support even number kernel size,"
                padding = (kernel_size - 1) // 2 * dilation
        """
        # NOTE: subject to change
        if padding is None:
            if use_causal_conv:
                padding = "causal"
            else:
                padding = "same"

        self.use_causal_conv = use_causal_conv

        # dilation conv
        # NOTE: subject to change
        self.conv = Conv1D(residual_channels, gate_channels, kernel_size,
                           padding=padding, dilation=dilation, bias=bias)

        # local conditioning
        # NOTE: subject to change
        if aux_channels > 0:
            self.conv1x1_aux = Conv1D1x1(aux_channels, gate_channels, bias=False)
        else:
            self.conv1x1_aux = None

        # conv output is split into two groups
        gate_out_channels = gate_channels // 2
        self.conv1x1_out = Conv1D1x1(gate_out_channels, residual_channels, bias=bias)
        self.conv1x1_skip = Conv1D1x1(gate_out_channels, skip_channels, bias=bias)

        self.dropout_layer = Dropout(rate=self.dropout)

    def call(self, x, c):
        """Calculate forward propagation.

        Args:
            x (Tensor): Input tensor (B, residual_channels, T).
            c (Tensor): Local conditioning auxiliary tensor (B, aux_channels, T).

        Returns:
            Tensor: Output tensor for residual connection (B, residual_channels, T).
            Tensor: Output tensor for skip connection (B, skip_channels, T).

        """
        residual = x
        x = self.dropout_layer(x, training=self.training)
        x = self.conv(x)

        # remove future time steps if use_causal_conv conv
        x = x[:, :, int(residual.get_shape()[-1])] if self.use_causal_conv else x

        # split into two part for gated activation
        splitdim = 1
        xa, xb = tf.split(x, num_or_size_splits=2, axis=splitdim)
        
        # local conditioning
        if c is not None:
            assert self.conv1x1_aux is not None
            c = self.conv1x1_aux(c)
            ca, cb = tf.split(c, num_or_size_splits=2, axis=splitdim)
            xa, xb = xa + ca, xb + cb

        x = tf.keras.activations.tanh(xa) * tf.keras.activations.sigmoid(xb)

        # for skip connection
        s = self.conv1x1_skip(x)

        # for residual connection
        x = (self.conv1x1_out(x) + residual) * math.sqrt(0.5)

        return x, s
