import 'package:flutter/material.dart';
import 'package:flutter_func/widgets/units/image/image_place_holder.dart';

class ImageViewTest extends StatelessWidget {
  static const String routeName = "imageview_test";

  const ImageViewTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: ImageView(
          image: NetworkImage("https://ichengfeng.github.io/resource/app/noodle.jpg"),
          assetPlaceHolder: "assets/3x/common/ic_noodle.jpg",
          fit: BoxFit.cover,
          width: 160,height: 160,
          radius: 80,
          borderColor: Colors.red,
          borderWidth: 2,
          shadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(10, 10),
              spreadRadius: 5,
              blurRadius: 5
            )
          ],
        ),
      ),
    );
  }
}
