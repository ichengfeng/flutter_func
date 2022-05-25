import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final ImageProvider image;
  ///占位图仅支持本地图片
  final String? assetPlaceHolder;
  final double? height;
  final double? width;
  final BoxFit? fit;
  ///圆角
  final double? radius;
  ///边框
  final double? borderWidth;
  final Color? borderColor;
  ///阴影
  final  List<BoxShadow>? shadow;
  const ImageView({
    Key? key,
    required this.image,
    this.assetPlaceHolder,
    this.width = 0.0,
    this.height = 0.0,
    this.fit,
    this.radius,
    this.borderWidth,
    this.borderColor,
    this.shadow,
  }) : super(key: key);

  ImageView.network(String? url,{
    Key? key,
    this.assetPlaceHolder,
    this.width = 0.0,
    this.height = 0.0,
    this.fit,
    this.radius,
    this.borderWidth,
    this.borderColor,
    this.shadow,
    int? cacheWidth,
    int? cacheHeight,
  }) : image = url?.isNotEmpty == true
      ? ResizeImage.resizeIfNeeded(cacheWidth, cacheHeight, NetworkImage(url ?? "",))
      : AssetImage(assetPlaceHolder ?? "assets/3x/common/ic_noodle.jpg",),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = borderWidth ?? 0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!= null ? radius!+w : 0),
        border: borderWidth != null  ? Border.all(
          color: borderColor ?? Colors.white,
          width: borderWidth ?? 1,
        ) : null,
        boxShadow: shadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius!= null ? radius!+w : 0),
        child: FadeInImage(
          image: image,
          imageErrorBuilder:(context, error, stackTrace) {
            return Image.asset(assetPlaceHolder ?? 'assets/3x/common/ic_noodle.jpg',
              width: width != 0.0 ? width : null,
              height: height != 0.0 ? height : null,
              fit: fit,
            );
          },
          placeholder: AssetImage(assetPlaceHolder ?? 'assets/3x/common/ic_noodle.jpg'),
          fit: BoxFit.cover,
          width: width != 0.0 ? width : null,
          height: height != 0.0 ? height : null,
        ),
      ),
    );
  }
}