import 'dart:async';
import 'package:flutter/material.dart';

mixin StreamMixin<T extends StatefulWidget> on State<T>{

  late StreamController _controller;

  StreamController get controller => _controller;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<int>.broadcast();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

}