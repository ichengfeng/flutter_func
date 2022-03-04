import 'package:flutter/material.dart';
import 'package:flutter_func/func/login/login_test.dart';
import 'package:flutter_func/func/photo/photo_show_test.dart';
import 'package:flutter_func/func/player/player_test.dart';
import 'func/waterfall/waterfall.dart';
import 'func/cupertino/cupertino_test.dart';
import 'package:flutter_func/func/tableview/tableview_test.dart';
import 'package:flutter_func/func/scrollview/scroll_test.dart';
import 'func/tabbar/tabbar.dart';

import 'model/page_item_model.dart';

List<PageItemModel> itemList = [
  PageItemModel(LoginTestList.routeName, "登录style"),
  PageItemModel(PhotoShowTest.routeName, '图片展示'),
  PageItemModel(PlayerTest.routeName, '播放器'),
  PageItemModel(WaterfallPage.routeName, '瀑布流'),
  PageItemModel(CupertinoWidgetTest.routeName, 'Cupertino'),
  PageItemModel(TableViewTest.routeName, 'TableView'),
  PageItemModel(ScrollViewTest.routeName, 'ScrollView'),
  PageItemModel(TabBarTestPage.routeName, 'TabBar'),
];

List<String> pages = [
  '登录style', '图片展示', '播放器', '瀑布流',
  'Cupertino', 'TableView', 'ScrollView', "TabBar",
];