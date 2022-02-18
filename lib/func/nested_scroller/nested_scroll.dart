import 'package:flutter/material.dart';

import '../banner/cycle_banner.dart';

class NestedScrollPage extends StatelessWidget {
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
                    'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
                    fit: BoxFit.fitHeight,
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
