import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class Anim2Model with ChangeNotifier {
  CustomAnimationControl _control = CustomAnimationControl.play;

  CustomAnimationControl get control => _control;

  void play() {
    _control = CustomAnimationControl.play;
    notifyListeners();
  }

  void stop() {
    _control = CustomAnimationControl.stop;
    notifyListeners();
  }

  void reverse() {
    _control = CustomAnimationControl.playReverse;
    notifyListeners();
  }
}

class Anim3Model with ChangeNotifier {
  AnimationController? _controller;

  set controller(AnimationController controller) {
    _controller = controller;
  }

  void play() {
    _controller?.reset();
    _controller?.play();
  }

  void stop() {
    _controller?.stop();
  }
}