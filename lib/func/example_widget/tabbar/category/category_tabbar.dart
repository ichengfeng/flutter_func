import 'package:flutter/material.dart';
import 'package:flutter_func/idkit_assets_manage.dart';
import 'package:itools/screen_size.dart';

class CategoryTabBarPage extends StatelessWidget {
  static const String routeName = "/category_tabbar_test";

  const CategoryTabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Picker'),
      ),
      body: const CategoryTabBarContent(),
    );
  }
}

class CategoryTabBarContent extends StatefulWidget {
  const CategoryTabBarContent({Key? key}) : super(key: key);

  @override
  State<CategoryTabBarContent> createState() => _CategoryTabBarContentState();
}

class _CategoryTabBarContentState extends State<CategoryTabBarContent> with SingleTickerProviderStateMixin{

  List<String> tabs = [
    "推荐", "附近", "热门", "旅行热点", "露营初体验", "酒店民宿",
    "美食探店", "亲子", "小众", "自驾", "网红", "逛展"
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.amber,
          height: 120.px,
        ),
        TabBar(
          padding: EdgeInsets.only(top: 8.px,bottom: 8.px),
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.orange,
          labelStyle: TextStyle(fontSize: 36.rpx),
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: TextStyle(fontSize: 28.rpx),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.orange,width: 3.px),
          ),
          indicatorPadding: EdgeInsets.only(top: 45.px),
          tabs: tabs.map<Tab>((e) {
            return Tab(
              text: e,
              icon: Image(image:AssetImage(Assets.icSwitch),color: Colors.orange,),
            );
          }).toList(),
        ),
        Flexible(
          child: TabBarView(
            controller: _tabController,
            children: tabs.map((String e) {
              return Container(
                color: Colors.grey,
                child: Center(
                  child: Text(e,style: TextStyle(fontSize: 32.px),),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class TabBarItem extends StatelessWidget {
  const TabBarItem({Key? key, required this.items}) : super(key: key);

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items,
    );
  }
}