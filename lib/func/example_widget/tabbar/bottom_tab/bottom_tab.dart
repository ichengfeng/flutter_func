import 'package:flutter/material.dart';
import 'package:flutter_func/func/example_widget/tabbar/bottom_tab/pages/tab_page_1.dart';
import 'package:flutter_func/func/example_widget/tabbar/bottom_tab/pages/tab_page_2.dart';
import 'package:flutter_func/func/example_widget/tabbar/bottom_tab/pages/tab_page_3.dart';
import 'package:flutter_func/func/example_widget/tabbar/bottom_tab/pages/tab_page_4.dart';
import 'package:flutter_func/idkit_assets_manage.dart';
import 'package:flutter_func/widgets/colors/material_colors.dart';

class BottomTabBarPage extends StatefulWidget {
  const BottomTabBarPage({Key? key}) : super(key: key);

  @override
  State<BottomTabBarPage> createState() => _BottomTabBarPageState();
}

class _BottomTabBarPageState extends State<BottomTabBarPage> {

  int currentIndex = 0;
  static const double itemW = 28;

  final List<String> tabBarTitles = ['首页', '搜索', '视频', '游戏',];
  final List<String> selectImages = [Assets.icWifiH, Assets.icSearchH, Assets.icVideoH, Assets.icGameH];
  final List<String> unSelectImages = [Assets.icWifi, Assets.icSearch, Assets.icVideo, Assets.icGame];
  late List<BottomNavigationBarItem> _bottomTabs;
  final List<Widget> _tabs = const [WifiPage(), SearchPage(), VideoPage(), GamePage()];

  @override
  void initState() {
    super.initState();

    _bottomTabs = tabBarTitles.map((e) {
      int index = tabBarTitles.indexOf(e);
      return BottomNavigationBarItem(
        icon:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            unSelectImages[index],
            fit: BoxFit.cover,
            width: itemW,
            height: itemW,
          ),
        ),
        activeIcon:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            selectImages[index],
            fit: BoxFit.cover,
            width: itemW,
            height: itemW,
          ),
        ),
        label: e,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(244, 245, 245, 1.0),
        bottomNavigationBar: BottomNavigationBar(
          type:BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items:_bottomTabs,
          selectedItemColor: MaterialColorsMaps.themeBlue,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            // color: Colors.blue,///当设置有主题色或者itemColor时，这里的color不生效
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            // color: Colors.grey,
          ),
          onTap: (index){
            setState(() {
              currentIndex = index;
            });
          },
          // fixedColor: Colors.green,
        ),
        body:IndexedStack(///可以解决每次点击切换tab都刷新的问题。但是APP启动后不点击也要刷新所有tab
          index: currentIndex,
          children: _tabs,
        ),
    );
  }
}
