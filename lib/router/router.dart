import 'package:flutter/material.dart';
import 'package:flutter_func/func/photo/single_show/large_picture_display.dart';
import 'package:flutter_func/func/photo/list_show/large_pictures_show.dart';
import 'package:flutter_func/func/login/login_test.dart';
import 'package:flutter_func/func/player/chewie_player.dart';
import 'package:flutter_func/func/player/player.dart';
import 'package:flutter_func/func/player/player_test.dart';
import 'package:flutter_func/func/tabbar/tabbar.dart';
import 'package:flutter_func/func/tableview/easy/easy_tableview.dart';
import 'package:flutter_func/func/tableview/tableview_test.dart';
import 'package:flutter_func/func/waterfall/waterfall.dart';
import 'package:flutter_func/router/unknown.dart';
import 'package:flutter_func/func/login/regular_style/login.dart';
import '../func/cupertino/cupertino_test.dart';
import '../func/login/video_style/login_bg_video.dart';
import '../func/photo/photo_show_test.dart';
import '../func/scrollview/maituan/meituan.dart';
import '../func/scrollview/nested/nested_scroll.dart';
import '../func/scrollview/scroll_test.dart';
import '../func/tableview/handy_tableview/handy_tableview_test.dart';
import '../main.dart';

class CFRouter {
  static final Map<String, WidgetBuilder>routers = {
    MyMainPage.routeName: (ctx) => const MyMainPage(),
    LoginTestList.routeName: (ctx) => LoginTestList(),
    PhotoShowTest.routeName: (ctx) => PhotoShowTest(),
    PlayerTest.routeName: (ctx) => PlayerTest(),
    WaterfallPage.routeName: (ctx) => const WaterfallPage(),
    CupertinoWidgetTest.routeName: (ctx) => const CupertinoWidgetTest(),
    TableViewTest.routeName: (ctx) => TableViewTest(),
    ScrollViewTest.routeName: (ctx) => ScrollViewTest(),
    TabBarTestPage.routeName: (ctx) => const TabBarTestPage(),

    LoginPage.routeName: (ctx) => const LoginPage(),
    LoginBgWithVideoPage.routeName: (ctx) => const LoginBgWithVideoPage(),
    LargePictureDisplayPage.routeName: (ctx) => const LargePictureDisplayPage(),
    LargePicturesShowPage.routeName: (ctx) => const LargePicturesShowPage(),
    EasyTableView.routeName: (ctx) => const EasyTableView(),
    HandyTableViewTest.routeName: (ctx) => const HandyTableViewTest(),
    NestedScrollPage.routeName: (ctx) => const NestedScrollPage(),
    MTPlaceOrderPage.routeName: (ctx) => const MTPlaceOrderPage(),
  };

  static const String initialRoute = MyMainPage.routeName;

  static RouteFactory generateRoute(){
    return (settings) {
      if(settings.name == PlayerPage.routeName) {
        return MaterialPageRoute(builder: (ctx){
          return PlayerPage(videoUrl: settings.arguments as String);
        });
      }
      if(settings.name == ChewiePlayerPage.routeName) {
        return MaterialPageRoute(builder: (ctx){
          return ChewiePlayerPage(videoUrl: settings.arguments as String,);
        });
      }
      return null;
    };
  }

  static RouteFactory unknownRoute() {
    return (settings) {
      return MaterialPageRoute(builder: (ctx) {
        return const UnknownPage();
      });
    };
  }

}