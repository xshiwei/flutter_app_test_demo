import 'package:flutter/material.dart';

class CountModel with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void incrementCounter() {
    _count++;
    notifyListeners();
  }

  void reduceCounter() {
    _count--;
    notifyListeners();
  }
}