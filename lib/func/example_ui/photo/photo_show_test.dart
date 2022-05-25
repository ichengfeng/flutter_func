import 'package:flutter/material.dart';
import 'package:flutter_func/func/example_ui/photo/single_show/large_picture_display.dart';
import '../../../widgets/base/base_list.dart';
import '../../../widgets/units/toast/toast.dart';
import 'banner/cycle_banner.dart';
import 'list_show/large_pictures_show.dart';

class PhotoShowTest extends BaseListPage {
  static const String routeName = "/photo_show_test";

  PhotoShowTest({Key? key}) : super(key: key);

  final List<String> items = [
    "单图",
    "列表",
    "轮播图"
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
        const imageURL = 'https://picsum.photos/500/500';
        Navigator.of(context).pushNamed(LargePictureDisplayPage.routeName,
            arguments: imageURL);
        break;
      }
      case 1: {
        const images = [
          'https://picsum.photos/500/500?random=1',
          'https://picsum.photos/500/500?random=2',
          'https://picsum.photos/500/500?random=3',
        ];
        Navigator.of(context).pushNamed(LargePicturesShowPage.routeName, arguments: images);
        break;
      }
      case 2: {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return const CycleBannerPage();
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
