import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:itools/screen_size.dart';
import 'login_content.dart';


class LoginPage extends StatelessWidget {

  static const String routeName = "/login";

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Screen.initialize();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network('https://ichengfeng.github.io/resource/beauty/beauty_picture_7.jpg',fit: BoxFit.cover,),
          const LoginContentPage(),
        ],
      ),
    );
  }
}

