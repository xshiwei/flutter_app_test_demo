import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/animation/test_message_tip.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'animation_model.dart';

class AnimationTest extends StatelessWidget {
  const AnimationTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  _Anim1(),
                  _Anim2Column(),
                  _Anim3(),
                  const TestMessageTip(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Anim1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAnimation<Color?>(
        tween: Colors.greenAccent.tweenTo(Colors.blue),
        duration: 2.seconds,
        delay: 1.seconds,
        control: CustomAnimationControl.loop,
        builder: (context, child, color) => Container(
              color: color,
              width: 100,
              height: 100,
              alignment: Alignment.center,
              child: child,
            ),
        child: const Text("Anim1"));
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
          _Anim2Reverse(),
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
    ..add(Anim2Enum.color, Colors.red.tweenTo(Colors.amberAccent), 3.seconds)
    ..add(Anim2Enum.color, Colors.amberAccent.tweenTo(Colors.blue), 1.seconds);

  @override
  Widget build(BuildContext context) {
    debugPrint("anim2 build");
    return CustomAnimation<MultiTweenValues<Anim2Enum>>(
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
        child: const Text("Anim2"));
  }
}

class _Anim2Play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: Provider.of<Anim2Model>(context, listen: false).play,
      child: const Text("play"),
    );
  }
}

class _Anim2Stop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: Provider.of<Anim2Model>(context, listen: false).stop,
      child: const Text("stop"),
    );
  }
}

class _Anim2Reverse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: Provider.of<Anim2Model>(context, listen: false).reverse,
      child: const Text("reverse"),
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
  late Animation<double> _rotation;
  late AnimationController _rotationController;

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
    return ElevatedButton(
      onPressed: Provider.of<Anim3Model>(context, listen: false).play,
      child: const Text("play"),
    );
  }
}

class _Anim3Stop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: Provider.of<Anim3Model>(context, listen: false).stop,
      child: const Text("stop"),
    );
  }
}





