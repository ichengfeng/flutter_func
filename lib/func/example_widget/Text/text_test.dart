import 'package:flutter/material.dart';
import 'package:itools/screen_size.dart';

class TextTest extends StatelessWidget {

  static const String routeName = "/text_test";

  const TextTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text文本展示"),
      ),
      body: const TextTextContent(),
    );
  }
}

class TextTextContent extends StatelessWidget {
  const TextTextContent({Key? key}) : super(key: key);

  static String contentString = '';

  @override
  Widget build(BuildContext context) {
    Screen.initialize();

    contentString = "";
    contentString += "4月6日假期刚归来，众多腾讯员工迎接而来的是集体被裁告知。";
    contentString += "次日，依照腾讯官网资料，董事会主席兼首席执行官马化腾、总裁刘炽平2021年薪发生下降，其中马化腾总酬额同比下降约24.9%。";
    contentString += "董事会薪酬总额整体也出现下降，减少了1.19亿元左右。";

    return ListView(
      children: [
        Container(
          color: const Color(0xFFCCCCCC),
          alignment: Alignment.center,
          margin: EdgeInsets.all(12.px),
          padding: EdgeInsets.all(12.px),
          child: Text(
            contentString,
            style: TextStyle(
              fontSize: 17.px,
              // color: Colors.white,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [
                    Colors.deepPurple,
                    Colors.red,
                  ],
                ).createShader(Rect.fromLTWH(0, 0, Screen.screenWidth*2/3.0, 0)),
            ),
          ),
        ),
        Container(
          color: const Color(0xFFCCCCCC),
          margin: EdgeInsets.all(12.px),
          padding: EdgeInsets.all(12.px),
          child: Text.rich(
            TextSpan(
              children: contentString.characters.toList().map((e) {
                int index = contentString.characters.toList().indexOf(e);
                return TextSpan(
                  text: e,
                  style: TextStyle(
                    fontSize: index%2 == 0 ? 18.px : index%3 == 0 ? 24.px : 12.px,
                    color: Colors.primaries[index%Colors.primaries.length],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Container(
          color: const Color(0xFFCCCCCC),
          margin: EdgeInsets.all(12.px),
          padding: EdgeInsets.all(12.px),
          child: Text.rich(
            TextSpan(
              children: contentString.characters.toList().map((e) {
                int index = contentString.characters.toList().indexOf(e);
                return TextSpan(
                  text: e,
                  style: TextStyle(
                    fontSize: 36.px,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: [
                          Colors.primaries[index%Colors.primaries.length],
                          index%Colors.primaries.length == Colors.primaries.length-1
                              ? Colors.primaries[0]
                              : Colors.primaries[index%Colors.primaries.length + 1],
                        ],
                      ).createShader(Rect.fromLTWH(0, 0, Screen.screenWidth*2/3.0, 0)),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

