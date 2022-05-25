import 'package:flutter/material.dart';
import 'package:itools/screen_size.dart';

class TableTest extends StatelessWidget {
  static const String routeName = "/table_test";

  const TableTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Table展示"),
      ),
      body: const TableTestContent(),
    );
  }
}

class TableTestContent extends StatelessWidget {
  const TableTestContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Screen.initialize();

    final data = [
      ["单位称",'量纲','单位符号','单位名称','单位'],
      ["长度",'L','m','米','1m'],
      ["质量",'M','kg','千克','1kg'],
      ["时间",'T','s','秒','1s'],
      ["电流",'I','A','安培','1A'],
      ["热力学温度",'Θ','K','开尔文','1K'],
      ["物质的量",'N','mol','摩尔','1mol'],
      ["发光强度",'J','cd','坎德拉','1cd'],
    ];

    return Container(
      padding: EdgeInsets.all(12.px),
      child: Table(
        columnWidths: <int, TableColumnWidth>{
          0: FixedColumnWidth(100.px),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: TableBorder.all(
            color: Colors.black,
            width: 1.px
        ),
        children: data.map((s) {
          int section = data.indexOf(s);
          return TableRow(
            decoration: BoxDecoration(
                color: section == 0 ? Colors.grey : const Color(0xFFFFFFFF)
            ),
            children: s.map((r) {
              int row = s.toList().indexOf(r);
              return Container(
                color: row == 0 ? const Color(0xFFCCCCCC) : Colors.transparent,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical:12.px),
                child: Text(r),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}

