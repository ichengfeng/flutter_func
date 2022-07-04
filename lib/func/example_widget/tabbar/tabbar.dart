import 'package:flutter/material.dart';
import 'package:flutter_func/func/example_widget/tabbar/bottom_tab/bottom_tab.dart';
import 'package:flutter_func/func/example_widget/tabbar/category/category_tabbar.dart';
import 'package:flutter_func/widgets/base/base_list.dart';
import 'package:flutter_func/widgets/units/toast/toast.dart';


class TabBarTestPage extends BaseListPage {
  static const String routeName = "/tabbar_test";

  TabBarTestPage({Key? key}) : super(key: key);

  final List<String> items = [
    "CategoryTabbar",
    "BottomTabbar",
  ];

  @override
  String titleForPage() {
    return "TabBar Test";
  }

  @override
  List itemsForListView() {
    return items;
  }

  @override
  void itemDidSelectedAtIndex(BuildContext context, int index) {
    switch (index) {
      case 0: {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return const CategoryTabBarPage();
        }));
        break;
      }
      case 1: {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        return const BottomTabBarPage();
      }));
        break;
      }
      default:{
        Toast.showToast('功能开发中••••••');
        break;
      }
    }
  }
}
