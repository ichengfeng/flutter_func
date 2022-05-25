/*
* UI
* */
import 'package:flutter_func/func/example_ui/cupertino/cupertino_test.dart';
import 'package:flutter_func/func/example_ui/login/login_test.dart';
import 'package:flutter_func/func/example_ui/photo/photo_show_test.dart';
import 'package:flutter_func/func/example_ui/player/player_test.dart';
import 'package:flutter_func/func/example_ui/tableview/tableview_test.dart';
import 'package:flutter_func/func/example_ui/waterfall/waterfall.dart';

/*
* Widget
* */
import 'package:flutter_func/func/example_widget/Text/text_test.dart';
import 'package:flutter_func/func/example_widget/imageview/imageview_test.dart';
import 'package:flutter_func/func/example_widget/layout/layout_test.dart';
import 'package:flutter_func/func/example_widget/scrollview/scroll_test.dart';
import 'package:flutter_func/func/example_widget/tabbar/tabbar.dart';
import 'package:flutter_func/func/example_widget/table/table_test.dart';
import 'package:flutter_func/func/example_widget/webview/webview_test.dart';

/*
* Other Func
* */
import 'package:flutter_func/func/example_other_func/provider/provider_test.dart';

import 'model/page_item_model.dart';

List<PageItemModel> itemList = [
  PageItemModel(LoginTestList.routeName, "登录style"),
  PageItemModel(PhotoShowTest.routeName, '图片展示'),
  PageItemModel(PlayerTest.routeName, '播放器'),
  PageItemModel(WaterfallPage.routeName, '瀑布流'),
  PageItemModel(CupertinoWidgetTest.routeName, 'Cupertino'),
  PageItemModel(TableViewTest.routeName, 'TableView'),
];

List<PageItemModel> widgetList = [
  PageItemModel(LayoutTestPage.routerName, 'Layout'),
  PageItemModel(TextTest.routeName, 'Text Test'),
  PageItemModel(ImageViewTest.routeName, "ImageView"),
  PageItemModel(TabBarTestPage.routeName, 'TabBar'),
  PageItemModel(ScrollViewTest.routeName, 'ScrollView'),
  PageItemModel(WebViewTestPage.routerName, "WebView"),
  PageItemModel(TableTest.routeName, 'Table Test'),
];

List<PageItemModel> functionList = [
  PageItemModel(ProviderTestPage.routeName, 'Provider'),
];