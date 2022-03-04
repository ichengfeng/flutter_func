import 'dart:async';
import 'package:flutter/material.dart';

///计时器
class CountDownWidgetWrapper extends StatefulWidget {
  final CountDownWidgetBuilder builder;
  final CountdownController controller;

  const CountDownWidgetWrapper({Key? key, required this.builder, required this.controller}) : super(key: key);

  @override
  _CountDownWidgetWrapperState createState() => _CountDownWidgetWrapperState();
}

class _CountDownWidgetWrapperState extends State<CountDownWidgetWrapper> {
  @override
  void initState() {
    super.initState();
    widget.controller._countDownChanged = () {
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder.call(widget.controller.count);

  @override
  void dispose() {
    super.dispose();
    widget.controller.cancel();
  }
}

typedef CountDownWidgetBuilder = Widget Function(int count);

class CountdownController {
  final int startCount;

  final int endCount;

  int _countDown = 0;

  int get count => _countDown;

  late VoidCallback _countDownChanged;

  late Timer? _timer = Timer(const Duration(seconds: 1), (){});

  CountdownController({this.startCount = 60, this.endCount = 0});

  void start() {
    _countDown = startCount;
    _countDownChanged.call();
    cancel();

    _timer = Timer.periodic(
      const Duration(seconds: 1), (Timer timer) {
        if (_countDown == endCount) {
          timer.cancel();
        } else {
          _countDown--;
        }
        _countDownChanged.call();
      },
    );
  }

  void cancel() {
    if (_timer != null && _timer?.isActive == true) {
      _timer?.cancel();
    }
  }
}
