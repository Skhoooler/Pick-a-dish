import 'package:flutter/material.dart';
import 'dart:math' as math;

class PADInputBorder extends InputBorder {
  final BorderRadius borderRadius;

  const PADInputBorder(
      {super.borderSide = const BorderSide(),
      this.borderRadius = const BorderRadius.only(
        topLeft: Radius.circular(4.0),
        topRight: Radius.circular(4.0),
      )});

  @override
  InputBorder copyWith({BorderSide? borderSide, BorderRadius? borderRadius}) {
    return PADInputBorder(
        borderSide: borderSide ?? this.borderSide,
        borderRadius: borderRadius ?? this.borderRadius);
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: borderSide.width);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
        ..addRect(Rect.fromLTWH(rect.left, rect.top, rect.width, math.max(0.0, rect.height - borderSide.width)));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
        ..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  bool get isOutline => false;

  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection? textDirection}) {

  }

  @override
  ShapeBorder scale(double t) {
    return PADInputBorder(borderSide: borderSide.scale(t));
  }
}
