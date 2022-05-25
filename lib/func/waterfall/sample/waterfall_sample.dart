import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:itools/screen_size.dart';

import '../../../widgets/colors/material_colors.dart';
import 'constant.dart';

class WaterfallSamplePage extends StatelessWidget {
  const WaterfallSamplePage({
    Key? key,
    this.type = WaterfallType.masonry
  }) : super(key: key);

  final WaterfallType? type;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('$type'),
      ),
      body: Container(
        child: getWaterfallSample(),
      ),
    );
  }

  Widget getWaterfallSample() {
    switch (type ?? WaterfallType.masonry) {
      case WaterfallType.staggered: {
        return const StaggeredGridView();
      }
      case WaterfallType.masonry:
        return const MasonryGrid();
      case WaterfallType.quilted:
        return const QuiltedView();
      case WaterfallType.woven:
        return const WovenView();
      case WaterfallType.staired:
        return const StairedView();
      case WaterfallType.aligned:
        return const AlignedView();
    }
  }
}

class StaggeredGridView extends StatelessWidget {
  const StaggeredGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: const [
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: Tile(index: 0),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: Tile(index: 1),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Tile(index: 2),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Tile(index: 3),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 4,
          mainAxisCellCount: 2,
          child: Tile(index: 4),
        ),
      ],
    );
  }
}

class MasonryGrid extends StatelessWidget {
  const MasonryGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemCount: 24,
      itemBuilder: (ctx,index){
        return Tile(
          index: index,
          height: (index%5 + 1)*100.px,
        );
      },
    );
  }
}

class QuiltedView extends StatelessWidget {
  const QuiltedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 2),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => Tile(index: index),
      ),
    );
  }
}

class WovenView extends StatelessWidget {
  const WovenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        pattern: [
          const WovenGridTile(1),
          const WovenGridTile(
            5 / 7,
            crossAxisRatio: 0.9,
            alignment: AlignmentDirectional.centerEnd,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => Tile(index: index),
      ),
    );
  }
}

class StairedView extends StatelessWidget {
  const StairedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverStairedGridDelegate(
        crossAxisSpacing: 48,
        mainAxisSpacing: 24,
        startCrossAxisDirectionReversed: true,
        pattern: [
          const StairedGridTile(0.5, 1),
          const StairedGridTile(0.5, 3 / 4),
          const StairedGridTile(1.0, 10 / 4),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => Tile(index: index),
      ),
    );
  }
}

class AlignedView extends StatelessWidget {
  const AlignedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return Tile(
          index: index,
          height: (index % 7 + 1) * 30,
        );
      },
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({Key? key, required this.index,this.height = 50}) : super(key: key);

  final int index;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: MaterialColorsMaps.themeBlue[300],
      child: Center(
        child: Text(
          '$index',
          style: TextStyle(
              color: Colors.white,
              fontSize: 32.px
          ),
        ),
      ),
    );
  }
}