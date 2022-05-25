import 'package:flutter/material.dart';
import 'package:flutter_func/func/example_other_func/future/future_builder/future_builder.dart';
import 'package:flutter_func/widgets/base/base_list.dart';

class FutureTestPage extends BaseListPage {
  static const String routeName = "/future_test";

  const FutureTestPage({Key? key}) : super(key: key);

  @override
  String titleForPage() {
    return "Provider_Test";
  }

  @override
  List itemsForListView() {
    return ["FutureBuilder"];
  }

  @override
  void itemDidSelectedAtIndex(BuildContext context, int index) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
      return const FutureBuilderPage();
    }));
  }

}
