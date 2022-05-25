import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_func/idkit_assets_manage.dart';
import 'package:flutter_func/widgets/units/timer/count_down_widget.dart';
import 'package:itools/log.dart';
import 'package:itools/screen_size.dart';


class LoginInputAreaPage extends StatefulWidget {
  const LoginInputAreaPage({Key? key}) : super(key: key);

  @override
  _LoginInputAreaPageState createState() => _LoginInputAreaPageState();
}

class _LoginInputAreaPageState extends State<LoginInputAreaPage> {

  final mobileController = TextEditingController();
  final codeController = TextEditingController();
  bool showClear = false;
  bool canLogin = false;
  bool sendMessage = false;
  CountdownController timerManger = CountdownController(startCount: 5);///计时器组件

  @override
  void initState() {
    super.initState();

    ///监听手机号码输入框值变化
    mobileController.addListener(() {
      setState(() {
        showClear = mobileController.text.isNotEmpty;
        canLogin = mobileController.text.length == 11 &&
            codeController.text.length == 6;
      });
    });

    ///监听验证码输入框值变化
    codeController.addListener(() {
      setState(() {
        canLogin = mobileController.text.length == 11 &&
            codeController.text.length == 6;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final itemList = [
      Container(height: 40.rpx, width: 0.5.rpx, color: const Color(0xFFD9D9D9),),///vline分割线
      SizedBox(width: 24.rpx,),
      TextButton(
        style: const ButtonStyle(
          splashFactory: NoSplash.splashFactory,///移除点击水波纹效果
        ),
        onPressed: () {
          if (sendMessage == true) {
            return;
          }
          setState(() {
            sendMessage = true;
            timerManger.start();
          });
        },
        child: CountDownWrapper(builder: (count){
          if (count == 0) {
            sendMessage = false;
          }
          return Text(
            sendMessage ? count == 0 ? '发送验证码' : "$count s" : '发送验证码',
            style: TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 24.rpx),
          );
        }, controller: timerManger,),
      ),
    ];

    if (showClear) {
      itemList.insert(0, clearWidget());
    }

    return contentContainer(itemList);
  }

  Widget contentContainer(List<Widget> itemList) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.rpx, 0, 20.rpx, 0),
      child: Column(
        children: <Widget>[
          // mobileInputWidget(itemList),
          textFieldWidget(mobileController, const Icon(Icons.phone_iphone,color: Colors.white,), '请输入手机号',itemList: itemList),
          SizedBox(height: 32.rpx,),
          textFieldWidget(codeController, const Icon(Icons.lock,color: Colors.white,), '请输入短信验证码'),
          SizedBox(height: 48.rpx,),
          loginButtonWidget(),
        ],
      ),
    );
  }

  ///自定义输入框
  Widget textFieldWidget(TextEditingController controller, Widget preIcon, String hintStr, {List<Widget>? itemList}) {
    return SizedBox(
      height: 92.rpx,
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 32.rpx,
          color: Colors.white,
        ),
        keyboardType: TextInputType.number,
        decoration: textFieldDecoration(
          preIcon,
          hintStr,
          sufIcon: itemList != null ? suffixIconWidget(itemList) : null ,
        ),
        cursorRadius: Radius.circular(46.rpx),
        // maxLength: 11,//此方法会在右下角显示最长字符以及当前输入的长度
        inputFormatters: <TextInputFormatter>[
          //设置最大输入长度
          LengthLimitingTextInputFormatter(controller == codeController ? 6 : 11)
        ],
      ),
    );
  }

  ///修饰输入框
  InputDecoration textFieldDecoration(Widget preIcon, String hintStr,{Widget? sufIcon}) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.rpx, vertical: 20.rpx),
      prefixIcon: preIcon,
      suffixIcon: sufIcon ?? const Text(''),
      hintText: hintStr,
      hintStyle: TextStyle(fontSize: 32.rpx,color: Colors.white.withOpacity(0.6)),
      // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(46.rpx))),
      filled: true,
      fillColor: Colors.white.withOpacity(0.16),
      isCollapsed: true,
      enabledBorder: OutlineInputBorder( //未选中时候的颜色
        borderRadius: BorderRadius.all(Radius.circular(46.rpx)),
        borderSide: const BorderSide(color: Colors.transparent,),
      ),
      focusedBorder: OutlineInputBorder( //选中时外边框颜色
        borderRadius: BorderRadius.all(Radius.circular(46.rpx)),
        borderSide: const BorderSide(color: Colors.transparent,),
      ),
    );
  }

  ///手机号输入框后面的发送短信按钮等等
  Widget suffixIconWidget(List<Widget> itemList) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12.rpx, 0, 32.rpx, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: itemList,
      ),
    );
  }

  ///清除输入框信息按钮
  Widget clearWidget() {
    return Padding(
      padding: EdgeInsets.only(right: 24.rpx),
      child: GestureDetector(
        child: Image.asset(
          Assets.icDelete,
          width: 32.rpx,
          height: 32.rpx,
        ),
        onTap: () {
          mobileController.clear();
        },
      ),
    );
  }

  ///登录按钮
  Widget loginButtonWidget() {
    return Container(
      width: double.infinity,
      height: 92.rpx,
      decoration: BoxDecoration(
        color: const Color(0xFF17b8d1).withOpacity(canLogin ? 1.0 : 0.6),
        borderRadius: BorderRadius.all(Radius.circular(46.rpx)),
      ),
      child: TextButton(
        style: const ButtonStyle(
          splashFactory: NoSplash.splashFactory,///移除点击水波纹效果
        ),
        onPressed: () {
          ///1、获取用户名和密码
          final username = mobileController.text;
          final password = codeController.text;
          printf('账号：$username 密码：$password');
        },
        child: Text(
          '登 录',
          style: TextStyle(fontSize: 36.rpx, color: Colors.white.withOpacity(canLogin ? 1 : 0.6)),
        ),
      ),
    );
  }
}