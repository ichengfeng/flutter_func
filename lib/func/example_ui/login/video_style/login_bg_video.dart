import 'package:flutter/material.dart';
import 'package:flutter_func/func/example_ui/login/regular_style/login_content.dart';
import 'package:flutter_func/func/example_ui/player/player.dart';
import 'package:flutter_func/idkit_assets_manage.dart';


class LoginBgWithVideoPage extends StatelessWidget {

  static const String routeName = "/login_bg_video";

  const LoginBgWithVideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PlayerPage(videoUrl: Assets.juexingVideo,),
          const LoginContentPage()
        ],
      ),
    );
  }
}
