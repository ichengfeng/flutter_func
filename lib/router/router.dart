import 'package:flutter/material.dart';
import 'package:flutter_func/func/large_picture/large_picture_display.dart';
import 'package:flutter_func/func/large_picture/large_pictures_show.dart';
import 'package:flutter_func/func/login/other_style/login_bg_video.dart';
import 'package:flutter_func/func/player/chewie_player.dart';
import 'package:flutter_func/func/player/player.dart';
import 'package:flutter_func/router/unknown.dart';
import 'package:flutter_func/func/login/login.dart';
import '../main.dart';

class CFRouter {
  static final Map<String, WidgetBuilder>routers = {
    MyMainPage.routeName: (ctx) => MyMainPage(),
    LoginPage.routeName: (ctx) => const LoginPage(),
    LoginBgWithVideoPage.routeName: (ctx) => const LoginBgWithVideoPage(),
    LargePictureDisplayPage.routeName: (ctx) => const LargePictureDisplayPage(),
    // PlayerPage.routeName: (ctx) => const PlayerPage(),
    // ChewiePlayerPage.routeName: (ctx) => const ChewiePlayerPage(),
    // LargePicturesShowPage.routeName: (ctx) => const LargePicturesShowPage(),
  };

  static const String initialRoute = MyMainPage.routeName;

  static RouteFactory generateRoute(){
    return (settings) {
      if(settings.name == LargePictureDisplayPage.routeName) {
        return MaterialPageRoute(builder: (ctx){
          return LargePicturesShowPage(imageUrls: settings.arguments as List<String>,);
        });
      }
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