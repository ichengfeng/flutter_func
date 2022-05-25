import 'package:flutter/material.dart';

class EasyTableView extends StatelessWidget {

  static const String routeName = "/easy_table";

  const EasyTableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyTableView'),
      ),
      body: TableView(
        sections: 2,
        itemCount: 10,
        sectionHeadView: defaultContainerBuilder("Header",color: Colors.white),
        sectionFootView: defaultContainerBuilder("Footer",color: const Color(0xFFF8F8F8)),
      ),
    );
  }

  Widget defaultContainerBuilder(String text,{Color color = Colors.white,}) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
      alignment: Alignment.center,
      child: Text('----- $text -----',style: TextStyle(color: text == "Header" ? Colors.red : Colors.orange),),
    );
  }
}

class TableView extends StatefulWidget {
  const TableView({
    Key? key,
    this.sections = 1,
    required this.itemCount,
    this.tableViewHeaderView, 
    this.tableViewFooterView,
    this.sectionHeadView,
    this.sectionFootView,
  }) : super(key: key);

  final int sections;
  final int itemCount;
  final Widget? tableViewHeaderView;
  final Widget? tableViewFooterView;
  final Widget? sectionHeadView;
  final Widget? sectionFootView;

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  ///tableViewHeadView + rows + tableViewSectionView + sectionHeadView + sectionFootView
  get _rows => (widget.tableViewHeaderView != null ? 1 : 0)
      + widget.itemCount*widget.sections
      + (widget.tableViewFooterView != null ? 1 : 0)
      + (widget.sectionHeadView != null ? widget.sections : 0)
      + (widget.sectionFootView != null ? widget.sections : 0);

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    print(_rows);
    return ListView.builder(
      itemCount: _rows,
      itemBuilder: (ctx,index) {
        if(index == 0 && widget.sectionHeadView != null) {
          return widget.sectionHeadView!;
        }else if (index == _rows - 1 && widget.sectionFootView != null) {
          return widget.sectionFootView!;
        }else {
          return rowItemBuilder(index);
        }
      },
    );
  }

  Widget rowItemBuilder(int index) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      alignment: Alignment.center,
      color: Colors.primaries[index%Colors.primaries.length],
      child: Text('$index'),
    );
  }
}

