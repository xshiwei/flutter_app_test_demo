import 'dart:math';

import 'package:flutter/material.dart';

class HandleWidget extends StatefulWidget {
  ///画板的大小
  final double size;

  ///手势圆的半径
  final double handleRadius;

  final Function(double rotate, double distance)? onMove;

  const HandleWidget({
    Key? key,
    this.size = 120.0,
    this.handleRadius = 10.0,
    this.onMove,
  }) : super(key: key);

  @override
  _HandleWidgetState createState() => _HandleWidgetState();
}

class _HandleWidgetState extends State<HandleWidget> {
  final ValueNotifier<Offset> _offset = ValueNotifier(Offset.zero);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: GestureDetector(
        onPanEnd: onPanEnd,
        onPanUpdate: onPanUpdate,
        child: CustomPaint(
          painter: _HandlePainter(handR: widget.handleRadius, offset: _offset),
          size: Size(widget.size, widget.size),
        ),
      ),
    );
  }

  void onPanEnd(DragEndDetails details) {
    _offset.value = Offset.zero;
    widget.onMove?.call(0, 0);
  }

  void onPanUpdate(DragUpdateDetails details) {
    final offset = details.localPosition;
    double dx = 0.0;
    double dy = 0.0;
    dx = offset.dx - widget.size / 2;
    dy = offset.dy - widget.size / 2;
    var rad = atan2(dx, dy);
    if (dx < 0) {
      rad += 2 * pi;
    }
    var bgR = widget.size / 2 - widget.handleRadius;
    var thta = rad - pi / 2; //旋转坐标系90度
    var d = sqrt(dx * dx + dy * dy);
    if (d > bgR) {
      dx = bgR * cos(thta);
      dy = -bgR * sin(thta);
    }
    widget.onMove?.call(thta, d);
    _offset.value = Offset(dx, dy);
  }
}

class _HandlePainter extends CustomPainter {
  final double handR;

  final ValueNotifier<Offset> offset;
  final Color color;

  final Paint _paint = Paint();

  _HandlePainter({
    required this.handR,
    required this.offset,
    this.color = Colors.blue,
  }) : super(repaint: offset);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);
    final bgR = size.width / 2 - handR;
    canvas.translate(size.width / 2, size.height / 2);
    _paint.style = PaintingStyle.fill;
    _paint.color = color.withAlpha(100);
    canvas.drawCircle(Offset.zero, bgR, _paint);
    _paint.color = color.withAlpha(150);
    canvas.drawCircle(offset.value, handR, _paint);

    _paint.color = color;
    _paint.style = PaintingStyle.stroke;
    canvas.drawLine(Offset.zero, offset.value, _paint);
  }

  @override
  bool shouldRepaint(covariant _HandlePainter oldDelegate) {
    return oldDelegate.handR != handR ||
        oldDelegate.offset != offset ||
        oldDelegate.color != color;
  }
}
