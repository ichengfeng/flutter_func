import 'package:flutter/material.dart';
import 'package:flutter_func/initial_import.dart';
import 'package:flutter_func/router/unknown.dart';
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

    LayoutTestPage.routerName: (ctx) => const LayoutTestPage(),
    TextTest.routeName: (ctx) => const TextTest(),
    ImageViewTest.routeName: (ctx) => const ImageViewTest(),
    TabBarTestPage.routeName: (ctx) => const TabBarTestPage(),
    ScrollViewTest.routeName: (ctx) => ScrollViewTest(),
    WebViewTestPage.routerName: (ctx) => const WebViewTestPage(),
    TableTest.routeName: (ctx) => const TableTest(),

    ProviderTestPage.routeName: (ctx) => ProviderTestPage(),
    StreamTestPage.routeName: (ctx) => const StreamTestPage(),
    FutureTestPage.routeName: (ctx) => const FutureTestPage(),

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