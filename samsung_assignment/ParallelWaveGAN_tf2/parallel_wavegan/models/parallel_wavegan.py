# -*- coding: utf-8 -*-

"""Parallel WaveGAN Modules."""

import logging
import math

import tensorflow as tf
import tensorflow_probability as tfp

#from parallel_wavegan.layers import Conv1D
from tensorflow.keras.layers import Conv1D
from parallel_wavegan.layers import Conv1D1x1
from parallel_wavegan.layers import ResidualBlock
from parallel_wavegan.layers import upsample


class ParallelWaveGANGenerator(tf.keras.layers.Layer):
    """Parallel WaveGAN Generator module."""

    def __init__(self,
                 in_channels=1,
                 out_channels=1,
                 kernel_size=3,
                 layers=30,
                 stacks=3,
                 residual_channels=64,
                 gate_channels=128,
                 skip_channels=64,
                 aux_channels=80,
                 aux_context_window=2,
                 dropout=0.0,
                 use_weight_norm=True,
                 use_causal_conv=False,
                 upsample_conditional_features=True,
                 upsample_net="ConvInUpsampleNetwork",
                 upsample_params={"upsample_scales": [4, 4, 4, 4]},
                 ):
        """Initialize Parallel WaveGAN Generator module.

        Args:
            in_channels (int): Number of input channels.
            out_channels (int): Number of output channels.
            kernel_size (int): Kernel size of dilated convolution.
            layers (int): Number of residual block layers.
            stacks (int): Number of stacks i.e., dilation cycles.
            residual_channels (int): Number of channels in residual conv.
            gate_channels (int):  Number of channels in gated conv.
            skip_channels (int): Number of channels in skip conv.
            aux_channels (int): Number of channels for auxiliary feature conv.
            aux_context_window (int): Context window size for auxiliary feature.
            dropout (float): Dropout rate. 0.0 means no dropout applied.
            use_weight_norm (bool): Whether to use weight norm.
                If set to true, it will be applied to all of the conv layers.
            use_causal_conv (bool): Whether to use causal structure.
            upsample_conditional_features (bool): Whether to use upsampling network.
            upsample_net (str): Upsampling network architecture.
            upsample_params (dict): Upsampling network parameters.

        """
        super(ParallelWaveGANGenerator, self).__init__()
        self.in_channels = in_channels
        self.out_channels = out_channels
        self.aux_channels = aux_channels
        self.layers = layers
        self.stacks = stacks
        self.kernel_size = kernel_size

        # check the number of layers and stacks
        assert layers % stacks == 0
        layers_per_stack = layers // stacks

        # define first convolution
        self.first_conv = Conv1D1x1(in_channels, residual_channels, bias=True)

        # define conv + upsampling network
        if upsample_conditional_features:
            upsample_params.update({
                "use_causal_conv": use_causal_conv,
            })
            if upsample_net == "ConvInUpsampleNetwork":
                upsample_params.update({
                    "aux_channels": aux_channels,
                    "aux_context_window": aux_context_window,
                })
            self.upsample_net = getattr(upsample, upsample_net)(**upsample_params)
        else:
            self.upsample_net = None

        # define residual blocks
        self.conv_layers = list()
        for layer in range(layers):
            dilation = 2 ** (layer % layers_per_stack)
            conv = ResidualBlock(
                kernel_size=kernel_size,
                residual_channels=residual_channels,
                gate_channels=gate_channels,
                skip_channels=skip_channels,
                aux_channels=aux_channels,
                dilation=dilation,
                dropout=dropout,
                bias=True,  # NOTE: magenda uses bias, but musyoku doesn't
                use_causal_conv=use_causal_conv,
            )
            self.conv_layers += [conv]

        # define output layers
        self.last_conv_layers = list([
            tf.keras.layers.ReLU(),
            Conv1D1x1(skip_channels, skip_channels, bias=True),
            tf.keras.layers.ReLU(),
            Conv1D1x1(skip_channels, out_channels, bias=True),
        ])

        # apply weight norm
        if use_weight_norm:
            self.apply_weight_norm()

    def call(self, x, c):
        """Calculate forward propagation.

        Args:
            x (Tensor): Input noise signal (B, 1, T).
            c (Tensor): Local conditioning auxiliary features (B, C ,T').

        Returns:
            Tensor: Output tensor (B, out_channels, T)

        """
        # perform upsampling
        if c is not None and self.upsample_net is not None:
            c = self.upsample_net(c)
            assert int(c.get_shape()[-1]) == int(x.get_shape()[-1])

        # encode to hidden representation
        x = self.first_conv(x)
        skips = 0
        for f in self.conv_layers:
            x, h = f(x, c)
            skips += h
        skips *= math.sqrt(1.0 / len(self.conv_layers))

        # apply final layers
        x = skips
        for f in self.last_conv_layers:
            x = f(x)

        return x

    
    def remove_weight_norm(self):
        """Remove weight normalization module from all of the layers."""
        """
        def _remove_weight_norm(m):
            try:
                logging.debug(f"Weight norm is removed from {m}.")
                torch.nn.utils.remove_weight_norm(m)
            except ValueError:  # this module didn't have weight norm
                return

        self.apply(_remove_weight_norm)
        """
        logging.debug("[DEBUG] remove_weight_norm called.")

    def apply_weight_norm(self):
        """Apply weight normalization module from all of the layers."""
        def _apply_weight_norm(m):
            if isinstance(m, tf.keras.layers.Conv1D) or isinstance(m, tf.keras.layers.Conv2d):
                tfp.layers.weight_norm.WeightNorm(m)
                logging.debug(f"Weight norm is applied to {m}.")

        self.apply(_apply_weight_norm)

    @staticmethod
    def _get_receptive_field_size(layers, stacks, kernel_size,
                                  dilation=lambda x: 2 ** x):
        assert layers % stacks == 0
        layers_per_cycle = layers // stacks
        dilations = [dilation(i % layers_per_cycle) for i in range(layers)]
        return (kernel_size - 1) * sum(dilations) + 1

    @property
    def receptive_field_size(self):
        """Return receptive field size."""
        return self._get_receptive_field_size(self.layers, self.stacks, self.kernel_size)


class ParallelWaveGANDiscriminator(tf.keras.layers.Layer):
    """Parallel WaveGAN Discriminator module."""

    def __init__(self,
                 in_channels=1,
                 out_channels=1,
                 kernel_size=3,
                 layers=10,
                 conv_channels=64,
                 nonlinear_activation="LeakyReLU",
                 nonlinear_activation_params={"alpha": 0.2},
                 bias=True,
                 use_weight_norm=True,
                 ):
        """Initialize Parallel WaveGAN Discriminator module.

        Args:
            in_channels (int): Number of input channels.
            out_channels (int): Number of output channels.
            kernel_size (int): Number of output channels.
            layers (int): Number of conv layers.
            conv_channels (int): Number of chnn layers.
            nonlinear_activation (str): Nonlinear function after each conv.
            nonlinear_activation_params (dict): Nonlinear function parameters
            bias (int): Whether to use bias parameter in conv.
            use_weight_norm (bool) Whether to use weight norm.
                If set to true, it will be applied to all of the conv layers.

        """
        super(ParallelWaveGANDiscriminator, self).__init__()
        assert (kernel_size - 1) % 2 == 0, "Not support even number kernel size."
        self.conv_layers = list()
        conv_in_channels = in_channels
        for i in range(layers - 1):
            if i == 0:
                dilation = 1
            else:
                dilation = i
                conv_in_channels = conv_channels
            padding = "same"
            conv_layer = [
                Conv1D(conv_in_channels, conv_channels,
                       kernel_size=kernel_size, padding=padding,
                       dilation=dilation, bias=bias),
                getattr(tf.keras.layers, nonlinear_activation)(**nonlinear_activation_params)
            ]
            self.conv_layers += conv_layer
        padding = "same"
        last_conv_layer = Conv1D(
            conv_in_channels, out_channels,
            kernel_size=kernel_size, padding=padding, bias=bias)
        self.conv_layers += [last_conv_layer]

        # apply weight norm
        if use_weight_norm:
            self.apply_weight_norm()

    def call(self, x):
        """Calculate forward propagation.

        Args:
            x (Tensor): Input noise signal (B, 1, T).

        Returns:
            Tensor: Output tensor (B, 1, T)

        """
        for f in self.conv_layers:
            x = f(x)
        return x

    def apply_weight_norm(self):
        """Apply weight normalization module from all of the layers."""
        def _apply_weight_norm(m):
            if isinstance(m, tf.keras.layers.Conv1D) or isinstance(m, tf.keras.layers.Conv2d):
                tfp.layers.weight_norm.WeightNorm(m)
                logging.debug(f"Weight norm is applied to {m}.")

        self.apply(_apply_weight_norm)

    def remove_weight_norm(self):
        """Remove weight normalization module from all of the layers."""
        """
        def _remove_weight_norm(m):
            try:
                logging.debug(f"Weight norm is removed from {m}.")
                torch.nn.utils.remove_weight_norm(m)
            except ValueError:  # this module didn't have weight norm
                return

        self.apply(_remove_weight_norm)
        """
        logging.debug("[DEBUG] remove_weight_norm called.")



class ResidualParallelWaveGANDiscriminator(torch.nn.Module):
    """Parallel WaveGAN Discriminator module."""

    def __init__(self,
                 in_channels=1,
                 out_channels=1,
                 kernel_size=3,
                 layers=30,
                 stacks=3,
                 residual_channels=64,
                 gate_channels=128,
                 skip_channels=64,
                 dropout=0.0,
                 use_weight_norm=True,
                 use_causal_conv=False,
                 nonlinear_activation="LeakyReLU",
                 nonlinear_activation_params={"alpha": 0.2},
                 ):
        """Initialize Parallel WaveGAN Discriminator module.

        Args:
            in_channels (int): Number of input channels.
            out_channels (int): Number of output channels.
            kernel_size (int): Kernel size of dilated convolution.
            layers (int): Number of residual block layers.
            stacks (int): Number of stacks i.e., dilation cycles.
            residual_channels (int): Number of channels in residual conv.
            gate_channels (int):  Number of channels in gated conv.
            skip_channels (int): Number of channels in skip conv.
            dropout (float): Dropout rate. 0.0 means no dropout applied.
            use_weight_norm (bool): Whether to use weight norm.
                If set to true, it will be applied to all of the conv layers.
            use_causal_conv (bool): Whether to use causal structure.
            nonlinear_activation_params (dict): Nonlinear function parameters

        """
        super(ResidualParallelWaveGANDiscriminator, self).__init__()
        assert (kernel_size - 1) % 2 == 0, "Not support even number kernel size."

        self.in_channels = in_channels
        self.out_channels = out_channels
        self.layers = layers
        self.stacks = stacks
        self.kernel_size = kernel_size

        # check the number of layers and stacks
        assert layers % stacks == 0
        layers_per_stack = layers // stacks

        # define first convolution
        self.first_conv = tf.keras.Sequential(
            Conv1D1x1(in_channels, residual_channels, bias=True),
            getattr(tf.keras.layers, nonlinear_activation)(**nonlinear_activation_params),
        )

        # define residual blocks
        self.conv_layers = list()
        for layer in range(layers):
            dilation = 2 ** (layer % layers_per_stack)
            conv = ResidualBlock(
                kernel_size=kernel_size,
                residual_channels=residual_channels,
                gate_channels=gate_channels,
                skip_channels=skip_channels,
                aux_channels=-1,
                dilation=dilation,
                dropout=dropout,
                bias=True,  # NOTE: magenda uses bias, but musyoku doesn't
                use_causal_conv=use_causal_conv,
            )
            self.conv_layers += [conv]

        # define output layers
        self.last_conv_layers = list([
            getattr(tf.keras.layers, nonlinear_activation)(**nonlinear_activation_params),
            Conv1D1x1(skip_channels, skip_channels, bias=True),
            getattr(tf.keras.layers, nonlinear_activation)(**nonlinear_activation_params),
            Conv1D1x1(skip_channels, out_channels, bias=True),
        ])

        # apply weight norm
        if use_weight_norm:
            self.apply_weight_norm()

    def call(self, x):
        """Calculate forward propagation.

        Args:
            x (Tensor): Input noise signal (B, 1, T).

        Returns:
            Tensor: Output tensor (B, 1, T)

        """
        x = self.first_conv(x)

        skips = 0
        for f in self.conv_layers:
            x, h = f(x, None)
            skips += h
        skips *= math.sqrt(1.0 / len(self.conv_layers))

        # apply final layers
        x = skips
        for f in self.last_conv_layers:
            x = f(x)
        return x

    def apply_weight_norm(self):
        """Apply weight normalization module from all of the layers."""
        def _apply_weight_norm(m):
            if isinstance(m, tf.keras.layers.Conv1D) or isinstance(m, tf.keras.layers.Conv2d):
                tfp.layers.weight_norm.WeightNorm(m)
                logging.debug(f"Weight norm is applied to {m}.")

        self.apply(_apply_weight_norm)

    def remove_weight_norm(self):
        """Remove weight normalization module from all of the layers."""
        """
        def _remove_weight_norm(m):
            try:
                logging.debug(f"Weight norm is removed from {m}.")
                torch.nn.utils.remove_weight_norm(m)
            except ValueError:  # this module didn't have weight norm
                return

        self.apply(_remove_weight_norm)
        """
        logging.debug("[DEBUG] remove_weight_norm called.")