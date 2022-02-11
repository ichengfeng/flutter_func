import 'package:flutter/material.dart';
import 'package:flutter_func/func/waterfall_layout/constant.dart';
import 'package:flutter_func/func/waterfall_layout/waterfall_sample.dart';
import 'package:flutter_func/widgets/colors/material_colors.dart';
import 'package:itools/screen_size.dart';

class WaterfallPage extends StatelessWidget {
  const WaterfallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Screen.initialize();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('瀑布流'),
      ),
      body: const WaterfallContent(),
    );
  }
}

class WaterfallContent extends StatelessWidget {
  const WaterfallContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: const [
          CardItem(title: "Staggered",type: WaterfallType.staggered,),
          CardItem(title: "Masonry",type: WaterfallType.masonry,),
          CardItem(title: "Quilted",type: WaterfallType.quilted,),
          CardItem(title: "Woven",type: WaterfallType.woven,),
          CardItem(title: "Staired",type: WaterfallType.staired,),
          CardItem(title: "Aligned",type: WaterfallType.aligned,),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    this.title,
    required this.type,
  }) : super(key: key);

  final String? title;
  final WaterfallType type;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      margin: EdgeInsets.all(8.px),
      child: GestureDetector(
        child: Container(
          width: double.infinity,
          height: 100,
          color: MaterialColorsMaps.themeBlue[300],
          child: Center(
            child: Text(title ?? "",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.px
              ),
            ),
          ),
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return WaterfallSamplePage(type: type,);
          }));
        },
      ),
    );
  }
}



