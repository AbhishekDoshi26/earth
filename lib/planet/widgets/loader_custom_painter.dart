import 'dart:math';

import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  final double value;
  final Color color;

  StarPainter(this.value, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) * 0.8;

    for (int i = 0; i < 5; i++) {
      final angle = value * pi * 2 + pi * i / 5;
      final distance = radius;

      final dx = center.dx + cos(angle) * distance;
      final dy = center.dy + sin(angle) * distance;

      final starPaint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      final starPath = Path()
        ..moveTo(dx, dy - 8.0)
        ..lineTo(dx + 6.0, dy + 4.0)
        ..lineTo(dx - 8.0, dy - 2.0)
        ..lineTo(dx + 8.0, dy - 2.0)
        ..lineTo(dx - 6.0, dy + 4.0)
        ..close();

      canvas.drawPath(starPath, starPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
