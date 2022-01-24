import 'package:flutter/material.dart';
import 'package:itools/screen_size.dart';

class LargePictureDisplayPage extends StatelessWidget {

  static const String routeName = "/large_picture";

  const LargePictureDisplayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String imageUrl = ModalRoute.of(context)?.settings.arguments as String;

    Screen.initialize();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          LargePicture(imageUrl: imageUrl),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: Screen.statusHeight*2+88.rpx,
                child: CloseButton(color: Colors.white,onPressed: (){
                  Navigator.of(context).pop();
                },),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LargePicture extends StatelessWidget {
  const LargePicture({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pop();
        },
        child: Hero(
          tag: imageUrl,
          child: Image.network(imageUrl, fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
