import 'package:flutter/material.dart';

//星星评分效果实现
class CFStartRating extends StatefulWidget {

  final double rating;///评分
  final double maxRating;///满分
  final int count;///星星数量
  final double size;///星星的大小
  final Color unselectedColor;
  final Color selectedColor;
  final Widget unselectedImage;
  final Widget selectedImage;

  CFStartRating({
    Key? key,
    required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    Widget? unselectedImage,
    Widget? selectedImage
  }) : unselectedImage = unselectedImage ?? Icon(Icons.star_border ,color: unselectedColor, size: size),
        selectedImage = selectedImage ?? Icon(Icons.star, color: selectedColor, size: size);

  @override
  _StartRatingState createState() => _StartRatingState();
}

class _StartRatingState extends State<CFStartRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(mainAxisSize: MainAxisSize.min, children: buildUnselectStar()),
        Row(mainAxisSize: MainAxisSize.min, children: buildSelectStar()),
      ],
    );
  }

  List<Widget> buildUnselectStar() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }

  List<Widget> buildSelectStar() {
    ///1、创建stars
    List<Widget> stars = [];
    final star = widget.selectedImage;

    ///2、构建满填充的star
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();
    for (var i = 0; i < entireCount; i++) {
      stars.add(star);
    }

    ///3、构建部分填充的start
    double leftWidth = ((widget.rating / oneValue) - entireCount)*widget.size;
    stars.add(
        ClipRect(
          child: star,
          clipper: CFStarClipper(leftWidth),
        )
    );
    if (stars.length > widget.count) {
      return stars.sublist(0,widget.count);
    }
    return stars;
  }
}

/*渲染半个五角星*/
class CFStarClipper extends CustomClipper<Rect> {
  double width;

  CFStarClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(covariant CFStarClipper oldClipper) {
    return oldClipper.width != width;
  }

}