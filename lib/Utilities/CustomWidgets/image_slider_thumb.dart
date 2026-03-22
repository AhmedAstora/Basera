import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ImageSliderThumb extends SliderComponentShape {
  final ui.Image image;
  final double size;

  ImageSliderThumb({
    required this.image,
    this.size = 37,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(size, size);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    final Rect imageRect = Rect.fromCenter(
      center: center,
      width: size,
      height: size,
    );

    paintImage(
      canvas: canvas,
      rect: imageRect,
      image: image,
      fit: BoxFit.contain,
    );
  }
}
