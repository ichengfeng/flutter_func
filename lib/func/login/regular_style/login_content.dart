import 'package:flutter/material.dart';
import 'package:itools/screen_size.dart';
import 'login_input_area.dart';

class LoginContentPage extends StatelessWidget {
  const LoginContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            height: 298.rpx,
            child: Image(
              image: const NetworkImage('https://ichengfeng.github.io/resource/tabbar/video_h@3x.png'),
              width: 78.rpx,
              height: 120.rpx,
            ),
          ),
          SizedBox(height: 32.rpx,),
          Text('管理系统', style: TextStyle(color:Colors.white, fontSize: 40.rpx,),),
          SizedBox(height: 80.rpx,),
          const LoginInputAreaPage(),
        ],
      ),
    );
  }
}
