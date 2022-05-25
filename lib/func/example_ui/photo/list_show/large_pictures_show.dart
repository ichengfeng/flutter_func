import 'package:flutter/material.dart';
import 'package:itools/screen_size.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class LargePicturesShowPage extends StatelessWidget {

  static const String routeName = "/large_pictures_show";

  const LargePicturesShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Screen.initialize();
    final List<String> imageUrls = ModalRoute.of(context)?.settings.arguments as List<String>;

    return Scaffold(
      body: Stack(
        children: [
          PhotoGalleryWidget(imageUrls: imageUrls),
          Container(
            alignment: Alignment.centerRight,
            height: Screen.statusHeight*2+88.rpx,
            child: CloseButton(
              color: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoGalleryWidget extends StatelessWidget {
  const PhotoGalleryWidget({
    Key? key,
    required this.imageUrls,
  }) : super(key: key);

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return PhotoViewGallery.builder(
      backgroundDecoration: const BoxDecoration(
        color: Colors.black,
      ),
      itemCount: imageUrls.length,
      scrollPhysics: const BouncingScrollPhysics(),
      enableRotation: true,
      builder: (ctx,index){
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(imageUrls[index]),
          heroAttributes: PhotoViewHeroAttributes(tag: imageUrls[index]),
        );
      },
      loadingBuilder: (context, event) => Center(
        child: SizedBox(
          width: 20.px,
          height: 20.px,
          child: CircularProgressIndicator(
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded / (event.expectedTotalBytes as num),
          ),
        ),
      ),
    );
  }
}

// ListView.builder(
// itemCount: images.length,
// scrollDirection: Axis.horizontal,
// physics: const BouncingScrollPhysics(),
// itemBuilder: (ctx,index) {
// return Center(
// child: Image.network(images[index]),
// );
// },
// );