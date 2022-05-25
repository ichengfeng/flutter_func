import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
/*
* 1、创建需要共享的数据
* */
class CounterViewModel with ChangeNotifier {

  int _counter = 0;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}