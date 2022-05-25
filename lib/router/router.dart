import 'package:flutter/material.dart';
import 'package:flutter_func/func/Text/text_test.dart';
import 'package:flutter_func/func/imageview/imageview_test.dart';
import 'package:flutter_func/func/layout/layout_test.dart';
import 'package:flutter_func/func/photo/single_show/large_picture_display.dart';
import 'package:flutter_func/func/photo/list_show/large_pictures_show.dart';
import 'package:flutter_func/func/login/login_test.dart';
import 'package:flutter_func/func/player/chewie_player.dart';
import 'package:flutter_func/func/player/player.dart';
import 'package:flutter_func/func/player/player_test.dart';
import 'package:flutter_func/func/provider/provider_multi/provider_multi.dart';
import 'package:flutter_func/func/tabbar/tabbar.dart';
import 'package:flutter_func/func/tableview/easy/easy_tableview.dart';
import 'package:flutter_func/func/tableview/tableview_test.dart';
import 'package:flutter_func/func/waterfall/waterfall.dart';
import 'package:flutter_func/func/webview/webview_test.dart';
import 'package:flutter_func/router/unknown.dart';
import 'package:flutter_func/func/login/regular_style/login.dart';
import '../func/cupertino/cupertino_test.dart';
import '../func/login/video_style/login_bg_video.dart';
import '../func/photo/photo_show_test.dart';
import '../func/provider/provider_single/provider_single.dart';
import '../func/provider/provider_test.dart';
import '../func/scrollview/maituan/meituan.dart';
import '../func/scrollview/nested/nested_scroll.dart';
import '../func/scrollview/scroll_test.dart';
import '../func/table/table_test.dart';
import '../func/tableview/handy_tableview/handy_tableview_test.dart';
import '../main.dart';

class CFRouter {
  static final Map<String, WidgetBuilder>routers = {
    ///首页用到的路由
    MyMainPage.routeName: (ctx) => const MyMainPage(),
    LoginTestList.routeName: (ctx) => LoginTestList(),
    PhotoShowTest.routeName: (ctx) => PhotoShowTest(),
    PlayerTest.routeName: (ctx) => PlayerTest(),
    WaterfallPage.routeName: (ctx) => const WaterfallPage(),
    CupertinoWidgetTest.routeName: (ctx) => const CupertinoWidgetTest(),
    TableViewTest.routeName: (ctx) => TableViewTest(),
    ScrollViewTest.routeName: (ctx) => ScrollViewTest(),
    WebViewTestPage.routerName: (ctx) => const WebViewTestPage(), 
    TabBarTestPage.routeName: (ctx) => const TabBarTestPage(),
    ProviderTestPage.routeName: (ctx) => ProviderTestPage(),
    LayoutTestPage.routerName: (ctx) => const LayoutTestPage(),
    TextTest.routeName: (ctx) => const TextTest(),
    TableTest.routeName: (ctx) => const TableTest(),
    ImageViewTest.routeName: (ctx) => const ImageViewTest(),

    ///其他页面
    LoginPage.routeName: (ctx) => const LoginPage(),
    LoginBgWithVideoPage.routeName: (ctx) => const LoginBgWithVideoPage(),
    LargePictureDisplayPage.routeName: (ctx) => const LargePictureDisplayPage(),
    LargePicturesShowPage.routeName: (ctx) => const LargePicturesShowPage(),
    EasyTableView.routeName: (ctx) => const EasyTableView(),
    HandyTableViewTest.routeName: (ctx) => const HandyTableViewTest(),
    NestedScrollPage.routeName: (ctx) => const NestedScrollPage(),
    MTPlaceOrderPage.routeName: (ctx) => const MTPlaceOrderPage(),
    ProviderSinglePage.routeName: (ctx) => const ProviderSinglePage(),
    ProviderMultiPage.routeName: (ctx) => const ProviderMultiPage(),
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