import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            child: const CFDashedLine(dashedWidth: 8, count: 15,color: Colors.green,),
          ),
          Container(
            height: 200,
            child: const CFDashedLine(axis: Axis.vertical, dashedHeight: 6, count: 15,),
          )
        ],
      ),
    );
  }
}

//实现虚线效果
class CFDashedLine extends StatelessWidget {

  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  const CFDashedLine({
    Key? key,
    this.axis = Axis.horizontal,
    this.dashedWidth = 1,
    this.dashedHeight = 1,
    this.count = 10,
    this.color = Colors.red,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (index) {
        return SizedBox(
          width: dashedWidth,
          height:  dashedHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(color: color),
          ),
        );
      }),
    );
  }
}