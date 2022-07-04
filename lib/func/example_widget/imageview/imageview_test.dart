import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_func/widgets/units/image/image_place_holder.dart';

class ImageViewTest extends StatelessWidget {
  static const String routeName = "imageview_test";

  const ImageViewTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List a = [1,2,3,4];
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 88,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/3x/common/ic_noodle.jpg",width: 100,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: a.map((e) {
                      int index = a.indexOf(e);
                      return buildImageView(index);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CachedNetworkImage(
              imageUrl: "",
              imageBuilder: (context, imageProvider) => Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/id/237/200/300'),
                      fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) {
                return Image.asset(
                  "assets/3x/common/ic_noodle.jpg",
                  fit: BoxFit.cover,
                );
              },
              errorWidget: (context, url, error) {
                return Image.asset(
                  "assets/3x/common/ic_noodle.jpg",
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageView(int index) {
    return Positioned(
      left: 20.0 * index,
      width: 30, height: 30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          "assets/3x/common/ic_noodle.jpg",
          fit: BoxFit.cover,
          width: 30,height: 30,
        ),
      ),
    );
  }
}

// Center(
// child: ImageView(
// image: NetworkImage("https://ichengfeng.github.io/resource/app/noodle.jpg"),
// assetPlaceHolder: "assets/3x/common/ic_noodle.jpg",
// fit: BoxFit.cover,
// width: 160,height: 160,
// radius: 80,
// borderColor: Colors.red,
// borderWidth: 2,
// shadow: [
// BoxShadow(
// color: Colors.grey,
// offset: Offset(10, 10),
// spreadRadius: 5,
// blurRadius: 5,
// ),
// ],
// ),
// )


// [
// Positioned(
// left: 12.0 * 0,
// width: 30,
// height: 30,
// // textDirection: TextDirection.ltr,
// child: Image.asset("assets/3x/common/ic_noodle.jpg",width: 30,height: 30,),
// ),
// Positioned(
// left: 12.0 * 1,
// width: 30,
// height: 30,
// // textDirection: TextDirection.ltr,
// child: Image.asset("assets/3x/common/ic_noodle.jpg",width: 30,height: 30,),
// ),
// Positioned(
// left: 12.0 * 2,
// width: 30,
// height: 30,
// // textDirection: TextDirection.ltr,
// child: Image.asset("assets/3x/common/ic_noodle.jpg",width: 30,height: 30,),
// ),
// ],

