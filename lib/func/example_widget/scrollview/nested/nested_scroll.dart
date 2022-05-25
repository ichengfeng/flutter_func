import 'package:flutter/material.dart';
import 'package:flutter_func/func/example_ui/photo/banner/cycle_banner.dart';

class NestedScrollPage extends StatelessWidget {
  static const String routeName = "/nested_scroll_test";

  const NestedScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScrollContent();
  }
}

class ScrollContent extends StatelessWidget {
  const ScrollContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<String> _tabs = <String>["Tab1","Tab2"];

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[SliverAppBar(
                expandedHeight: 280.0,
                pinned: true,
                title: const Text('Books'),
                // forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  // title: const Text('复仇者联盟'),
                  background: Image.network(
                    'https://ichengfeng.github.io/resource/app/xinxi/banner/01.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: TabBar(
                  // These are the widgets to put in each tab in the tab bar.
                  labelStyle: const TextStyle(fontSize: 32),
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.white,
                  unselectedLabelStyle: const TextStyle(fontSize: 28),
                  indicator: const BoxDecoration(),
                  tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                ),
            )];
          },
          body: TabBarView(
            children: _tabs.map((e) {
              return Builder(
                builder: (BuildContext context) {
                  return const ContentListView();
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ContentListView extends StatelessWidget {
  const ContentListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 20,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context,int index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx) {
              return const CycleBannerPage();
            }));
          },
          child: Container(
            height: 80,
            color: Colors.primaries[index % Colors.primaries.length],
            alignment: Alignment.center,
            child: Text(
              '$index',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: child,
    );
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
