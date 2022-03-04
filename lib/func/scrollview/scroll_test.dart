import 'package:flutter/material.dart';
import '../../widgets/base/base_list.dart';
import '../../widgets/units/toast/toast.dart';
import 'maituan/meituan.dart';
import 'nested/nested_scroll.dart';

class ScrollViewTest extends BaseListPage {
  static const String routeName = "/scrollview_test";

  ScrollViewTest({Key? key}) : super(key: key);

  final List<String> items = [
    "NestedScroll",
    "CustomScroll",
  ];

  @override
  String titleForPage() {
    return "ScrollView";
  }

  @override
  List itemsForListView() {
    return items;
  }

  @override
  void itemDidSelectedAtIndex(BuildContext context, int index) {
    switch (index) {
      case 0: {
        Navigator.of(context).pushNamed(NestedScrollPage.routeName);
        break;
      }
      case 1: {
        Navigator.of(context).pushNamed(MTPlaceOrderPage.routeName);
        break;
      }
      default:{
        Toast.showToast('功能开发中••••••');
        break;
      }
    }
  }
}
