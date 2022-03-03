import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:itools/screen_size.dart';

class CycleBannerPage extends StatelessWidget {
  const CycleBannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CycleBanner"),
      ),
      body: const CycleBannerContent(),
    );
  }
}

class CycleBannerContent extends StatelessWidget {
  const CycleBannerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Screen.screenWidth,
      child: Column(
        children: [
          Container(
            height: 200,
            child: Swiper(
              itemCount: 8,
              pagination: const SwiperPagination(),
              // control: const SwiperControl(),
              autoplay: true,
              itemBuilder: (BuildContext context,int index){
                return Image.network("https://picsum.photos/500/500?random=$index",fit: BoxFit.fill,);
              },
            ),
          ),
          Row(
            children: [
              Expanded(child: leftContentWidget()),
              LimitedBox(child: rightContentWidget(),maxWidth: 92,),
            ],
          )
        ],
      ),
    );
  }
}


Widget leftContentWidget() {
  return Container(
    color: Colors.orange,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(children: [
          WidgetSpan(
            child: Image.asset('assets/3x/common/ic_switch.png',width: 16, height: 16,),
            baseline: TextBaseline.ideographic,
            alignment: PlaceholderAlignment.middle,
          ),
          const TextSpan(
            text: '发帖聊聊：聊聊你与辛巴的故事吧！聊聊你与辛巴的故事吧！与辛巴的故发帖聊聊：聊聊你与辛巴的故事吧！',
            style: TextStyle(
              color: Color(0xff191F19),
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          // const WidgetSpan(
          //   alignment: PlaceholderAlignment.middle,
          //   child: Text(
          //     "发帖聊聊：聊聊你与辛巴的故事吧！聊聊你与辛巴的故事吧！与辛巴的故发帖聊聊：聊聊你与辛巴的故事吧！",
          //     maxLines: 2,
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(
          //       color: Color(0xff191F19),
          //       fontWeight: FontWeight.w600,
          //       fontSize: 14,
          //     ),
          //   ),
          // ),
        ])),
        const SizedBox(height: 5,),
        const Text(
          "转眼间又是一年的秋天，气温也在逐渐地下降，不少姐妹都开始准妹都开始准妹都开始…",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color(0xff191F19),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}

Widget rightContentWidget() {
  return Container(
    color: Colors.blue,
    child: const Text(
      "+200",
      textAlign: TextAlign.end,
      style: TextStyle(
        color: Color(0xFFF20000),
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
    ),
  );
}
