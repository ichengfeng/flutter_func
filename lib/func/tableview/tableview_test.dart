import 'package:flutter/material.dart';
import 'package:flutter_func/func/tableview/handy_tableview/handy_tableview_test.dart';
import '../../widgets/base/base_list.dart';
import '../../widgets/units/toast/toast.dart';
import 'easy/easy_tableview.dart';
import 'idkit_tableview/tableview.dart';

class TableViewTest extends BaseListPage {
  static const String routeName = "/tableview_test_list";

  TableViewTest({Key? key}) : super(key: key);

  final List<String> items = [
    "IdKit_TableView",
    'Handy_TableView',
    "自定义（开发中）",
  ];

  @override
  String titleForPage() {
    return "TableView";
  }

  @override
  List itemsForListView() {
    return items;
  }

  @override
  void itemDidSelectedAtIndex(BuildContext context, int index) {
    switch (index) {
      case 0: {
        Navigator.push(context, MaterialPageRoute(builder: (ctx){
          return const MultipleTablePage();
        }));
        break;
      }
      case 1: {
        Navigator.of(context).pushNamed(HandyTableViewTest.routeName);
        break;
      }
      case 2: {
        Navigator.of(context).pushNamed(EasyTableView.routeName);
        break;
      }
      default:{
        Toast.showToast('功能开发中••••••');
        break;
      }
    }
  }
}
