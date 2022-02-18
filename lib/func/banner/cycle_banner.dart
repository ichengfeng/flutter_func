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
      child: Swiper(
        itemCount: 8,
        pagination: const SwiperPagination(),
        // control: const SwiperControl(),
        autoplay: true,
        itemBuilder: (BuildContext context,int index){
          return Image.network("https://picsum.photos/500/500?random=$index",fit: BoxFit.fill,);
        },
      ),
    );
  }
}

