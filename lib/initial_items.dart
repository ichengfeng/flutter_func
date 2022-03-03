import 'package:flutter/material.dart';
import 'package:flutter_func/func/base/test_list.dart';
import 'func/login/login.dart';
import 'package:flutter_func/func/banner/cycle_banner.dart';
import 'package:flutter_func/func/category_picker/category_picker.dart';
import 'package:flutter_func/func/login/other_style/login_bg_video.dart';
import 'package:flutter_func/func/maituan/meituan.dart';
import 'package:flutter_func/func/nested_scroller/nested_scroll.dart';
import 'package:flutter_func/func/tableview/easy_tableview.dart';
import 'package:flutter_func/func/cupertino_test/cupertino_test.dart';
import 'func/large_picture/large_picture_display.dart';
import 'func/large_picture/large_pictures_show.dart';
import 'func/player/chewie_player.dart';
import 'func/player/player.dart';
import 'func/tableview/tableview.dart';
import 'func/waterfall_layout/waterfall.dart';
import 'model/page_item_model.dart';

List<PageItemModel> itemList = [
  PageItemModel(0, "登录页面"),
  PageItemModel(1, '大图展示'),
  PageItemModel(2, '大图列表'),
  PageItemModel(3, '播放器'),
  PageItemModel(4, 'Chewie播放器'),
  PageItemModel(5, 'XX_Login'),
  PageItemModel(6, '瀑布流'),
  PageItemModel(7, 'Category'),
  PageItemModel(8, '轮播图'),
  PageItemModel(9, 'NestScroll'),
  PageItemModel(10, '美团商铺页面'),
  PageItemModel(11, 'TableView'),
  PageItemModel(12, 'Cupertino'),
  PageItemModel(13, 'EasyTable'),
  PageItemModel(14, 'TestList'),
];

void jumpToTargetPage(BuildContext context, PageItemModel model) {
  switch (model.index) {
    case 0:
      {
        Navigator.of(context).pushNamed(LoginPage.routeName);
        break;
      }
    case 1:
      {
        const imageURL = 'https://picsum.photos/500/500';
        // targetPage = const LargePictureDisplayPage(imageURL);
        Navigator.of(context).pushNamed(LargePictureDisplayPage.routeName,
            arguments: imageURL);
        break;
      }
    case 2:
      {
        const images = [
          'https://picsum.photos/500/500?random=1',
          'https://picsum.photos/500/500?random=2',
          'https://picsum.photos/500/500?random=3',
        ];
        // Navigator.of(context).pushNamed(LargePicturesShowPage.routeName,
        //     arguments: images);
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return const LargePicturesShowPage(imageUrls: images);
        }));
        break;
      }
    case 3:
      {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          String videoUrl = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
          return PlayerPage(videoUrl: videoUrl,);
        }));
        break;
      }
    case 4:
      {
        String beeUrl = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return ChewiePlayerPage(videoUrl: beeUrl,);
        }));
        break;
      }
    case 5:
      {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return const LoginBgWithVideoPage();
        }));
        break;
      }
    case 6:
      {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return const WaterfallPage();
        }));
        break;
      }
    case 7:
      {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return const CategoryPickerPage();
        }));
        break;
      }
    case 8:
      {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return const CycleBannerPage();
        }));
        break;
      }
    case 9:
      {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return const NestedScrollPage();
        }));
        break;
      }
    case 10:
      {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return const MTPlaceOrderPage();
        }));
        break;
      }
    case 11:
      {
        Navigator.push(context, MaterialPageRoute(builder: (ctx){
          return const MultipleTablePage();
        }));
        break;
      }
    case 12:
      {
        Navigator.push(context, MaterialPageRoute(builder: (ctx){
          return const CupertinoWidgetTest();
        }));
        break;
      }
    case 13:
      {
        Navigator.of(context).pushNamed(EasyTableView.routeName);
        break;
      }
    case 14:
      {
        Navigator.push(context, MaterialPageRoute(builder: (ctx){
          return TestList();
        }));
        break;
      }
  }
}