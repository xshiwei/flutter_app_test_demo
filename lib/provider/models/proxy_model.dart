import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/provider/models/count_model.dart';

class ProxyData{
  const ProxyData(this._value);

  final int _value;

  String get title => 'You clicked $_value times';
}

class ProxyModel extends ChangeNotifier{

  CountModel? _countModel;

  void updateCountModel(CountModel countModel){
    this._countModel = countModel;
    debugPrint("refresh");
    notifyListeners();
  }

  String get title => 'You clicked ${_countModel?.count} times';
}