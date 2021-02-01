import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class Anim2Model with ChangeNotifier {
  CustomAnimationControl _control = CustomAnimationControl.PLAY;

  CustomAnimationControl get control => _control;

  void play() {
    _control = CustomAnimationControl.PLAY;
    notifyListeners();
  }

  void stop() {
    _control = CustomAnimationControl.STOP;
    notifyListeners();
  }

  void reverse() {
    _control = CustomAnimationControl.PLAY_REVERSE;
    notifyListeners();
  }
}

class Anim3Model with ChangeNotifier {
  AnimationController _controller;

  set controller(AnimationController controller) {
    this._controller = controller;
  }

  void play() {
    _controller.reset();
    _controller.play();
  }

  void stop() {
    _controller.stop();
  }
}