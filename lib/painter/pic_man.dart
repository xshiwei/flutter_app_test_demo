import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class PicMan extends StatefulWidget {
  @override
  _PicManState createState() => _PicManState();
}

class _PicManState extends State<PicMan> with AnimationMixin {
  Animation<double> angle;
  Animation<Color> color;

  @override
  void initState() {
    super.initState();
    angle = 10.0.tweenTo(40).animatedBy(controller);
    color = Colors.blue.tweenTo(Colors.red).animatedBy(controller);
    controller.repeat(reverse: true, period: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: CustomPaint(
        painter: _PicManPainter(color: color, angle: angle, repaint: controller),
        size: Size(100.0, 100.0),
      ),
    );
  }
}

class _PicManPainter extends CustomPainter {
  ///颜色
  final Animation<Color> color;

  ///角度
  final Animation<double> angle;

  final Animation<double> repaint;

  ///画笔
  Paint _paint = Paint();

  _PicManPainter({@required this.color, @required this.angle,this.repaint}) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);
    final double radius = size.width / 2;
    canvas.translate(size.width / 2, size.height / 2);
    _drawHead(canvas, size);
    _drawEye(canvas, radius);
  }

  @override
  bool shouldRepaint(covariant _PicManPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.angle != angle;
  }

  ///绘制头部
  void _drawHead(Canvas canvas, Size size) {
    var a = this.angle.value / 180 * pi;
    var rect = Rect.fromCenter(center: Offset.zero, width: size.width, height: size.height);
    canvas.drawArc(rect, a, 2 * pi - a.abs() * 2, true, _paint..color = color.value);
  }

  ///绘制眼睛
  void _drawEye(Canvas canvas, double radius) {
    canvas.drawCircle(Offset(radius * 0.15, radius * -0.6), radius * 0.12, _paint..color = Colors.white);
  }
}
