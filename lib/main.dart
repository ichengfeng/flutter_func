import 'package:flutter/material.dart';
import 'package:flutter_func/model/page_item_model.dart';
import 'package:flutter_func/router/router.dart';
import 'package:flutter_func/widgets/colors/material_colors.dart';
import 'package:itools/screen_size.dart';
import 'initial_items.dart';
import 'package:bot_toast/bot_toast.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Screen.initialize();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: themeColor,
        primarySwatch: MaterialColorsMaps.themeBlue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      routes: CFRouter.routers,
      initialRoute: CFRouter.initialRoute,
      onUnknownRoute: CFRouter.unknownRoute(),
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
    );
  }
}

class MyMainPage extends StatelessWidget {
  static const String routeName = "/";

  const MyMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          '工作台',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (ctx, index) {
          return MyMainPageItem(
            model: itemList[index],
            index: index,
          );
        },
      ),
    );
  }
}

class MyMainPageItem extends StatelessWidget {
  final PageItemModel model;
  final int index;

  const MyMainPageItem({
    Key? key,
    required this.model,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.rpx, right: 16.rpx, top: 16.rpx),
      child: GestureDetector(
        child: Container(
          height: 98.rpx,
          color: Colors.white.withOpacity(0.6),
          child: Center(
            child: Text(model.title),
          ),
        ),
        onTap: () => Navigator.of(context).pushNamed(model.routeName),
      ),
    );
  }
}