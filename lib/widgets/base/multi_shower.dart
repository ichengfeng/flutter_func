import 'package:flutter/material.dart';

class MultiShower extends StatelessWidget {
  const MultiShower(
      this.list,
      this.call, {Key? key,
        this.width = 110,
        this.height = 110 * 0.618,
        this.info,
        this.color,
      }) : super(key: key);

  final List list;
  final List<String>? info;
  final Function call;
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    var li = <Widget>[];
    for (var i = 0; i < list.length; i++) {
      var child = Container(
          margin: const EdgeInsets.all(7),
          color: color,
          width: width,
          height: height,
          child: call(list[i]));
      li.add(Column(
        children: <Widget>[
          child,
          Text(info != null ? info![i] : list[i].toString().split(".")[1])
        ],
      ));
    }
    return Wrap(children: li,);
  }
}