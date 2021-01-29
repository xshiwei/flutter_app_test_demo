import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class TestMessageTip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TestMessageTipModel(),
      builder: (_, child) => _AnimationColumn()
    );
  }
}

class _AnimationColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _Tip(),
            Flexible(child: ElevatedButton(
              onPressed: () {
                context.read<TestMessageTipModel>().start();
              },
              child: Text('start'),
            )),
            Flexible(child: ElevatedButton(
              onPressed: () {
                context.read<TestMessageTipModel>().pause();
              },
              child: Text('stop'),
            )),
            Flexible(child: ElevatedButton(
              onPressed: () {
                context.read<TestMessageTipModel>().reverse();
              },
              child: Text('reverse'),
            ))
          ],
        )
      ],
    );
  }
}


class _Tip extends StatefulWidget {
  @override
  __TipState createState() => __TipState();
}

class __TipState extends State<_Tip> with AnimationMixin {

  Animation _scale;

  @override
  void initState() {
    super.initState();
    _scale = 0.0.tweenTo(1.0).curved(Curves.easeIn).animate(controller);
    controller.duration = 1.seconds;
    context.read<TestMessageTipModel>().setController(controller);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
    );
  }
}



class TestMessageTipModel with ChangeNotifier {
  AnimationController _controller;

  void setController(AnimationController controller) {
    this._controller = controller;
  }

  void start() {
    _controller.forward();
  }

  void pause() {
    _controller.stop();
  }

  void reverse() {
    _controller.reverse();
  }

}
