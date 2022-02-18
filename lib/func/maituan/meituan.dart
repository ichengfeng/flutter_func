import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_func/func/maituan/pages/page1.dart';
import 'package:flutter_func/func/maituan/pages/page2.dart';
import 'package:flutter_func/func/maituan/pages/page3.dart';
import 'package:flutter_func/func/maituan/shop/shop_scroll_controller.dart';
import 'package:flutter_func/func/maituan/shop/shop_scroll_coordinator.dart';
import 'package:itools/screen_size.dart';

class MTPlaceOrderPage extends StatelessWidget {
  const MTPlaceOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ShopPage();
  }
}

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage>
    with SingleTickerProviderStateMixin {
  ///页面滑动协调器
  // ShopScrollCoordinator _shopCoordinator = ShopScrollCoordinator();
  // late ShopScrollController _pageScrollController;

  late TabController _tabController;

  final double _sliverAppBarInitHeight = 200;
  final double _tabBarHeight = 50;
  late double _sliverAppBarMaxHeight;

  @override
  void initState() {
    super.initState();
    // _shopCoordinator = ShopScrollCoordinator();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {

    Screen.initialize();
    _sliverAppBarMaxHeight = Screen.screenHeight;
    // _pageScrollController = _shopCoordinator
    //     .pageScrollController(_sliverAppBarMaxHeight - _sliverAppBarInitHeight);
    //
    // _shopCoordinator.pinnedHeaderSliverHeightBuilder = () {
    //   return Screen.statusHeight + kToolbarHeight + _tabBarHeight;
    // };
    return Scaffold(
      body: Listener(
        // onPointerUp: _shopCoordinator.onPointerUp,
        child: CustomScrollView(
          // controller: _pageScrollController,
          // physics: const ClampingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              title: const Text("店铺首页", style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.blue,
              expandedHeight: _sliverAppBarMaxHeight,
            ),
            SliverPersistentHeader(
              pinned: false,
              floating: true,
              delegate: _SliverAppBarDelegate(
                maxHeight: 100,
                minHeight: 100,
                child: const Center(child: Text("我是活动Header")),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: _SliverAppBarDelegate(
                maxHeight: _tabBarHeight,
                minHeight: _tabBarHeight,
                child: Container(
                  color: Colors.white,
                  child: TabBar(
                    labelColor: Colors.black,
                    controller: _tabController,
                    tabs: const <Widget>[
                      Tab(text: "商品"),
                      Tab(text: "评价"),
                      Tab(text: "商家"),
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children:  const <Widget>[
                  // Page1(shopCoordinator: _shopCoordinator),
                  // Page2(shopCoordinator: _shopCoordinator),
                  Page3(),
                  Page3(),
                  Page3(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    // _pageScrollController.dispose();
    super.dispose();
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
