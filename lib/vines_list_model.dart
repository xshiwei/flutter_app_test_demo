import 'dart:math';

import 'package:flutter/material.dart';

class VinesListModel extends ChangeNotifier {
  ///关卡数据
  int _length;

  List<Offset> _offsetList;

  List<Offset> get offsetList => _offsetList;

  BuildContext _context;

  ///表示半个周期的最大宽度
  double _maxWidth;

  ///表示半个周期的最大高度
  double _maxHeight;

  ///表示半个周期 0 到 pi/2 的直线距离
  double _distance;

  ///关卡控件的大小，正方形
  double _itemWidth;

  ///表示sin函数的快慢系数
  double _speedParameter = 1;

  ///表示最终的位置
  double _finallyYPosition = 0.0;

  Random _random;

  double dyDistance = 0.0;

  VinesListModel() {
    this._offsetList = <Offset>[];
    this._random = Random(30);
  }

  void setContext(BuildContext context, int length, double itemWidth) {
    this._context = context;
    this._length = length;
    this._itemWidth = itemWidth;
    this._maxWidth = MediaQuery.of(_context).size.width / 2;
  }

  ///暴露到外面的计算位置的方法
  void calculatePosition(double speedParameter) {
    //一个计数器，计算当前是哪个开口方向
    var count = 1;
    ///第一个不用计算位置
    _addOffset(_maxWidth, _finallyYPosition);

    var length = _length - 1;
    while (length > 0) {
      _initData(speedParameter);
      var num = _calculateList(_isUp(count), length);
      length = length - num;
      count++;
    }
    notifyListeners();
  }

  ///判断是否是true,单数表示函数开口向上
  bool _isUp(int count) {
    return count % 2 == 1;
  }

  void _addOffset(double x, double y) {
    _offsetList.add(Offset(x, y));
  }

  ///更新distance
  void updateDyDistance(double distance){
    dyDistance += distance;
    if(dyDistance <= 0){
      dyDistance = 0;
    }else if(dyDistance > _finallyYPosition){
      dyDistance = _finallyYPosition;
    }
    notifyListeners();
  }

  ///初始化基本数据
  void _initData(double speedParameter) {
    this._speedParameter = speedParameter;
    this._maxHeight = _getASin(1);
    this._distance = sqrt(pow(_maxWidth, 2) + pow(_maxHeight, 2));
  }

  ///根据正弦函数计算各个数据的位置,y轴相当于sin函数的x轴，x轴相当于sin函数的y轴
  ///[isUp] true开口向上的半个周期 false开口向下的一个周期
  int _calculateList(bool isUp, int length) {
    var halfNum = _halfItemNum();
    var oneItemNum = _oneItemNum();
    var oneNum = min(oneItemNum, length);
    var cycle = pi / _speedParameter;
    //平均的x值
    var sinX = cycle / (2 * (halfNum - 1));
    var avgY = _maxHeight / (halfNum - 1);
    var xPos;
    var yPos;
    var count = 0;
    for (int i = 1; i <= oneNum; i++) {
      if ((i == oneNum && length >= oneItemNum)) {
        break;
      }
      if (sin(_speedParameter * i * sinX) == 1) {
        continue;
      }
      yPos = i * avgY + _finallyYPosition + _random.nextInt(40) + 40;
      if (isUp) {
        xPos = _maxWidth - _getSin(i * sinX);
      } else {
        xPos = _maxWidth + _getSin(i * sinX);
      }
      if (_offsetList.last.dx == xPos) {
        yPos += 60;
      }
      _addOffset(xPos, yPos);
      count++;
    }
    _finallyYPosition = yPos;
    return count;
  }

  ///计算1/4周期最大容纳几个item(包括 x=0 和 x=pi/2的情况)
  ///在sin曲线最低点到最高点的直线距离，此时计算得到的数量就是最大的。
  int _halfItemNum() {
    var halfNum = _distance ~/ _itemWidth;
    assert(halfNum >= 2);
    return halfNum;
  }

  ///计算1/2个周期的数量
  int _oneItemNum() {
    return _halfItemNum() * 2 - 1;
  }

  ///该正弦函数假定为 y= A sin(Bx) ,A表示[_maxWidth],相当于扩大了[_maxWidth]倍
  double _getASin(double y) {
    return (asin(y) / _speedParameter) * _maxWidth;
  }

  ///该正弦函数假定为 y= A sin(Bx),获取当前位置的X距离
  double _getSin(double x) {
    return sin(_speedParameter * x) * _maxWidth;
  }
}
