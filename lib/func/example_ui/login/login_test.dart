import 'package:flutter/material.dart';
import 'package:flutter_func/func/example_ui/login/regular_style/login.dart';
import 'package:flutter_func/func/example_ui/login/video_style/login_bg_video.dart';

import '../../../widgets/base/base_list.dart';
import '../../../widgets/units/toast/toast.dart';

class LoginTestList extends BaseListPage {
  static const String routeName = "/login_test_list";

  LoginTestList({Key? key}) : super(key: key);

  final List<String> items = [
    "Regular Login Style",
    "Video Background",
  ];

  @override
  String titleForPage() {
    return "登录界面样式汇集";
  }

  @override
  List itemsForListView() {
    return items;
  }

  @override
  void itemDidSelectedAtIndex(BuildContext context, int index) {
    switch (index) {
      case 0: {
        Navigator.of(context).pushNamed(LoginPage.routeName);
        break;
      }
      case 1: {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return const LoginBgWithVideoPage();
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
