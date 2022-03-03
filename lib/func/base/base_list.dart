import 'dart:math';

import 'package:flutter/material.dart';
import 'package:itools/screen_size.dart';

typedef CellContentBuilder = String Function(int index);
typedef CellClickAction = void Function();

class BaseListPage extends StatelessWidget {
  const BaseListPage({Key? key}) : super(key: key);

  String titleForPage() =>  "";
  List itemsForListView() => [];
  void itemDidSelectedAtIndex(BuildContext context, int index) {}

  @override
  Widget build(BuildContext context) {

    final items = itemsForListView();

    return Scaffold(
      appBar: AppBar(
        title: Text(titleForPage(),
          style: TextStyle(color: Colors.black,fontSize: 18.px),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount:items.length,
        itemBuilder: (ctx,index){
          return BaseCell(
            index: index,
            title: items[index],
            onTap: () => itemDidSelectedAtIndex(context,index),
          );
        },
      ),
    );
  }
}

class BaseCell extends StatelessWidget {
  const BaseCell({
    Key? key,
    required this.title,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  final int index;
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.primaries[Random().nextInt(18)],
        padding: EdgeInsets.all(12.px),
        child: Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.px,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
