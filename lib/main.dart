import 'package:flutter/material.dart';
import 'package:flutter_func/model/page_item_model.dart';
import 'package:flutter_func/router/router.dart';
import 'package:flutter_func/widgets/colors/material_colors.dart';
import 'package:flutter_func/widgets/units/color/color_extension.dart';
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
        backgroundColor: Colors.transparent,
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
          'Flutter Work Space',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 16.px),
        children: [
          buildHeadView('Example For UI'),
          MyGridView(dataList: itemList,),
          buildHeadView('Example For Widget'),
          MyGridView(dataList: widgetList),
          buildHeadView('Example For Other Func'),
          MyGridView(dataList: functionList),
        ],
      ),
    );
  }

  Widget buildHeadView(String title){
    return Container(
      padding: EdgeInsets.only(left: 16.px,right: 16.px,),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.px,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  const MyGridView({
    Key? key,
    required this.dataList,
  }) : super(key: key);

  final List<PageItemModel> dataList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(12.px),
      itemCount: dataList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12.px,
          mainAxisSpacing: 12.px,
          mainAxisExtent: 44.px
      ),
      itemBuilder: (ctx, index){
        return MyMainPageItem(model: dataList[index], index: index);
      },
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
    return GestureDetector(
      child: Container(
        color: Colors.white.withOpacity(0.6),
        // padding: EdgeInsets.all(16.px),
        // margin: EdgeInsets.only(left: 12.px,right: 12.px,top: 12.px),
        alignment: Alignment.center,
        child: Text(model.title,style: TextStyle(color: colorWithHexString('333333')),),
      ),
      onTap: () => Navigator.of(context).pushNamed(model.routeName),
    );
  }
}