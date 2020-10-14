import 'dart:math';

import 'package:flutter/material.dart';

class VinesListModel extends ChangeNotifier {
  List _data;

  set(List data) {
    this._data = data;
  }

  BuildContext _context;

  ///表示半个周期的最大宽度
  double _maxWidth;

  void setContext(BuildContext context) {
    this._context = context;
    this._maxWidth = MediaQuery.of(_context).size.width / 2;
    debugPrint("_maxWidth --> $_maxWidth");
  }

  ///根据正弦函数计算各个数据的位置
  void calculateList(double itemWidth) {
    var maxItemNum = _maxItemNum(itemWidth);
    debugPrint("maxItemNum --> $maxItemNum");
    //平均的sinY值
    var sinY = 1 / maxItemNum;
    var yPos = _getASinX(1);
    var xPos = sinY * _maxWidth;
    debugPrint("xPos --> $xPos  yPos --> $yPos");
  }

  ///计算半个周期最大容纳几个item(包括 x=0 和 x=pi/2的情况)
  ///假定在最坏的情况下，就是直线的情况，此时计算得到的数量就是最大的。
  int _maxItemNum(double itemWidth) {
    return _maxWidth ~/ itemWidth;
  }

  ///该正弦函数假定为 y= A sin(x) ,A表示[_maxWidth],相当于扩大了[_maxWidth]倍
  double _getASinX(double y){
    debugPrint("asin y --> ${asin(y)}");
    return asin(y) * _maxWidth;
  }
}
