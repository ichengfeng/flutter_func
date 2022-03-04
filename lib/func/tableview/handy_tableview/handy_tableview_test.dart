import 'package:flutter/material.dart';
import 'package:flutter_func/func/tableview/handy_tableview/scr/tableview.dart';

class HandyTableViewTest extends StatelessWidget {
  static const String routeName = "/handy_tableview_test";

  const HandyTableViewTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HandyTableView"),
      ),
      body: HandyTableView(
        style: TableViewStyle.group,
        numberOfSections: 6,
        numberOfRowsInSection: (section) => section == 1 ? 3 : 10,
        cellForRowBuilder: (ctx,indexPath) {
          return Container(
            padding: const EdgeInsets.all(12),
            color: Colors.primaries[indexPath.row%Colors.primaries.length],
            child: Text('${indexPath.row}'),
          );
        },
        sectionHeaderBuilder: (ctx, section) {
          return defaultContainerBuilder("Header",color: Colors.white);
        },
        sectionFooterBuilder: (ctx, section) {
          return defaultContainerBuilder("Footer",color: const Color(0xFFF8F8F8));
        },
      ),
    );
  }

  Widget defaultContainerBuilder(String text,{Color color = Colors.white,}) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 12),
      alignment: Alignment.center,
      child: Text('----- $text -----',style: TextStyle(color: text == "Header" ? Colors.red : Colors.orange),),
    );
  }
}