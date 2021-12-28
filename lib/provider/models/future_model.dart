import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:supercharged/supercharged.dart';

class FutureBean1{
  final int count;

  const FutureBean1(this.count);
}

class FutureBean2{
  final int count;

  const FutureBean2(this.count);
}

class FutureProviderModel {
  Future<FutureBean1> testFuture() {
    debugPrint("testFuture");
    return Future.delayed(1.seconds, () {
      return const FutureBean1(1);
    });
  }

  Future<FutureBean2> testFuture2() {
    debugPrint("testFuture2");
    return Future.delayed(3.seconds, () {
      return const FutureBean2(4);
    });
  }
}

class StreamProviderModel {
  Stream<int> testStream() {
    return Stream.periodic(1.seconds, (computation) {
      return computation++;
    });
  }
}
