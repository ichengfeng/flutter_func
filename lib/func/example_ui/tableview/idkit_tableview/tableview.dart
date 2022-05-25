import 'package:flutter/material.dart';
import 'package:idkit_tableview/idkit_tableview.dart';

class MultipleTablePage extends StatefulWidget {
  const MultipleTablePage({Key? key}) : super(key: key);

  @override
  _MultipleTablePageState createState() => _MultipleTablePageState();
}

class _MultipleTablePageState extends State<MultipleTablePage> {

  final IDKitUpdateControl _updateControl = IDKitUpdateControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Table'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: IDKitTableView(
          style: TableViewStyle.group,
          updateControl: _updateControl,
          ///tableview_header
          headerInTableView: (Widget view) {
            return SizedBox(
              height: 120,
              child: Image.network('https://picsum.photos/375/120?random=1',fit: BoxFit.cover,),
            );
          },
          ///tableview_footer
          footerInTableView: (view) {
            return SizedBox(
              height: 120,
              child: Image.network('https://picsum.photos/375/120?random=2',fit: BoxFit.cover,),
            );
          },
          ///section_header
          headerInSection: (_, section){
            return Container(
              height: 60,
              color: Colors.grey,
              alignment: Alignment.center,
              child: const Text(
                'head view',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            );
          },
          ///section_footer
          footerInSection: (_, int section) {
            return Container(
              height: 60,
              color: Colors.grey,
              alignment: Alignment.center,
              child: const Text(
                'footer view',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28
                ),
              ),
            );
          },
          numberOfSection: (_) => 4,
          numberOfRowInSection: (_, section) {
            final int res = section%2;
            return res == 0 ? 4: 6;
          },
          itemForRowAtIndexPath: (_, indexPath) {
            if (indexPath.section == 1) {
              return Card(
                color: Colors.primaries[indexPath.row % Colors.primaries.length],
                child: Container(
                  height: 49,
                  alignment: Alignment.center,
                  child: Text(
                    "${indexPath.row}",
                    style: const TextStyle(color: Colors.white,fontSize: 24),
                  ),
                ),
              );
            }else {
              return Container(
                height: 44,
                color: Colors.primaries[indexPath.row % Colors.primaries.length],
                alignment: Alignment.center,
                child: Text(
                  "item = ${indexPath.row}",
                  style: const TextStyle(color: Colors.white,fontSize: 20),
                ),
              );
            }
          },
          hideDivider: true,
          separateInSection: (_, int section) {
            return Container(
              height: 38,
              color: Colors.white,
              alignment: Alignment.center,
              child: Text('------------ section分割线 -$section ------------'),
            );
          },
        ),
      ),
    );
  }
}
