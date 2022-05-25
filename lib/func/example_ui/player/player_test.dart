import 'package:flutter/material.dart';
import 'package:flutter_func/func/example_ui/player/player.dart';
import '../../../widgets/base/base_list.dart';
import '../../../widgets/units/toast/toast.dart';
import 'chewie_player.dart';

class PlayerTest extends BaseListPage {
  static const String routeName = "/player_test";

  PlayerTest({Key? key}) : super(key: key);

  final List<String> items = [
    "系统播放器",
    "chewie播放器",
  ];

  @override
  String titleForPage() {
    return "播放器";
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
          String videoUrl = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
          return PlayerPage(videoUrl: videoUrl,);
        }));
        break;
      }
      case 1: {
        String beeUrl = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return ChewiePlayerPage(videoUrl: beeUrl,);
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
