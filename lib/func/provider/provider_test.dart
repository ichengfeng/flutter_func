import 'package:flutter/material.dart';
import 'package:flutter_func/func/provider/provider_anywhere/provider_anwhere.dart';
import 'package:flutter_func/func/provider/provider_multi/provider_multi.dart';
import 'package:flutter_func/func/provider/provider_single/provider_single.dart';
import '../../widgets/base/base_list.dart';
import '../../widgets/units/toast/toast.dart';

class ProviderTestPage extends BaseListPage {
  static const String routeName = "/provider_test";

  ProviderTestPage({Key? key}) : super(key: key);

  final List<String> items = [
    "Single",
    "Multi",
    "Anywhere"
  ];

  @override
  String titleForPage() {
    return "Provider_Test";
  }

  @override
  List itemsForListView() {
    return items;
  }

  @override
  void itemDidSelectedAtIndex(BuildContext context, int index) {
    switch (index) {
      case 0: {
        Navigator.of(context).pushNamed(ProviderSinglePage.routeName);
        break;
      }
      case 1: {
        Navigator.of(context).pushNamed(ProviderMultiPage.routeName);
        break;
      }
      case 2: {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
          return const ProviderAnywherePage();
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

