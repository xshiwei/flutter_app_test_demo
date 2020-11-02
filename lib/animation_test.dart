import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'animation_model.dart';

class AnimationTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: _Anim2Column(),
            // ),
            Align(
              alignment: Alignment(-0.7, 0.7),
              child: _Anim3(),
            )
          ],
        ),
      ),
    );
  }
}

class _Anim1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAnimation<Color>(
        tween: Colors.redAccent.tweenTo(Colors.blue),
        duration: 2.seconds,
        delay: 1.seconds,
        control: CustomAnimationControl.LOOP,
        builder: (context, child, color) => Container(
              color: color,
              width: 100,
              height: 100,
              alignment: Alignment.center,
              child: child,
            ),
        child: Text("Anim1"));
  }
}

class _Anim2Column extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Anim2Model>(
      create: (_) => Anim2Model(),
      builder: (_, child) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Anim2(),
          _Anim2Play(),
          _Anim2Stop(),
        ],
      ),
    );
  }
}

enum Anim2Enum { width, color, rotate }

class _Anim2 extends StatelessWidget {
  final _tween = MultiTween<Anim2Enum>()
    ..add(Anim2Enum.width, 100.0.tweenTo(200.0), 1.seconds)
    ..add(Anim2Enum.width, 200.0.tweenTo(200.0), 2.seconds)
    ..add(Anim2Enum.width, 200.0.tweenTo(100.0), 1.seconds)
    ..add(Anim2Enum.color, Colors.red.tweenTo(Colors.red), 3.seconds)
    ..add(Anim2Enum.color, Colors.red.tweenTo(Colors.blue), 1.seconds);

  final _rotateTween = MultiTween<DefaultAnimationProperties>()
    ..add(DefaultAnimationProperties.rotation, 0.1.tweenTo(0.15), 30.milliseconds)
    ..add(DefaultAnimationProperties.rotation, 0.15.tweenTo(0.1), 30.milliseconds)
    ..add(DefaultAnimationProperties.rotation, 0.1.tweenTo(0.05), 30.milliseconds)
    ..add(DefaultAnimationProperties.rotation, 0.05.tweenTo(0.1), 30.milliseconds);

  @override
  Widget build(BuildContext context) {
    debugPrint("anim2 build");
    return LoopAnimation<MultiTweenValues<DefaultAnimationProperties>>(
      tween: _rotateTween,
      duration: _rotateTween.duration,
      builder: (_, child, value) => Transform.rotate(
        angle: value.get(DefaultAnimationProperties.rotation),
        child: child,
      ),
      child: CustomAnimation<MultiTweenValues<Anim2Enum>>(
          tween: _tween,
          control: Provider.of<Anim2Model>(context).control,
          delay: 2.seconds,
          duration: _tween.duration,
          builder: (_, child, value) => Container(
                color: value.get(Anim2Enum.color),
                width: value.get(Anim2Enum.width),
                height: value.get(Anim2Enum.width),
                child: child,
              ),
          child: Text("Anim2")),
    );
  }
}

class _Anim2Play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: Provider.of<Anim2Model>(context, listen: false).play,
      child: Text("play"),
    );
  }
}

class _Anim2Stop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: Provider.of<Anim2Model>(context, listen: false).stop,
      child: Text("stop"),
    );
  }
}

class _Anim3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Anim3Model>(
      create: (_) => Anim3Model(),
      builder: (_, child) => Column(
        children: [
          _AnimRotation(),
          _Anim3Play(),
          _Anim3Stop(),
        ],
      ),
    );
  }
}

class _AnimRotation extends StatefulWidget {
  @override
  __AnimRotationState createState() => __AnimRotationState();
}

class __AnimRotationState extends State<_AnimRotation> with AnimationMixin {
  Animation<double> _rotation;
  AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = createController()..mirror(duration: 2.seconds);
    _rotation = 0.1.tweenTo(0.5).animatedBy(_rotationController);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<Anim3Model>(context, listen: false).controller = _rotationController;
    return Transform.rotate(
      angle: _rotation.value,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),
    );
  }
}

class _Anim3Play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("play build");
    return RaisedButton(
      onPressed: Provider.of<Anim3Model>(context, listen: false).play,
      child: Text("play"),
    );
  }
}

class _Anim3Stop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: Provider.of<Anim3Model>(context, listen: false).stop,
      child: Text("stop"),
    );
  }
}
