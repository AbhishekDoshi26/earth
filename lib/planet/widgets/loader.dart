import 'package:flutter/material.dart';

import 'loader_custom_painter.dart';

class StarLoader extends StatefulWidget {
  final double size;
  final Color color;

  const StarLoader({super.key, this.size = 50.0, this.color = Colors.white});

  @override
  State<StarLoader> createState() => _StarLoaderState();
}

class _StarLoaderState extends State<StarLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: StarPainter(_controller.value, widget.color),
          size: Size(widget.size, widget.size),
        );
      },
    );
  }
}
