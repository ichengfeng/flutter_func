import 'package:flutter/material.dart';
import '../units/toast/toast.dart';
import 'base_list.dart';

class TestList extends BaseListPage {
  TestList({Key? key}) : super(key: key);

  final List<String> items = [
    "齐天大圣",
    "金刚葫芦娃",
    "黑猫警长",
    "蓝猫红兔七侠传",
  ];

  @override
  String titleForPage() {
    return "测试列表123";
  }

  @override
  List itemsForListView() {
    return items;
  }

  @override
  void itemDidSelectedAtIndex(BuildContext context, int index) {
    final String msg = '你看过\'${items[index]}\'吗';
    Toast.showToast(msg);
  }
}
