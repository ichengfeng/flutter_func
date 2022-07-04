import 'package:flutter/material.dart';
import 'package:flutter_func/widgets/base/multi_shower.dart';
import 'package:itools/screen_size.dart';

class BlendTestPage extends StatelessWidget {
  static const String routeName = "blend_mode_test";

  const BlendTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Screen.initialize();

    var colorBlendModes = [
      BlendMode.clear,BlendMode.src,BlendMode.dst,
      BlendMode.srcOver,BlendMode.dstOver,BlendMode.srcIn,
      BlendMode.dstIn,BlendMode.srcOut,BlendMode.dstOut,
      BlendMode.srcATop,BlendMode.dstATop,BlendMode.xor,
      BlendMode.plus, BlendMode.modulate,BlendMode.screen,
      BlendMode.overlay,BlendMode.darken,BlendMode.lighten,
      BlendMode.colorDodge,BlendMode.colorBurn,BlendMode.hardLight,
      BlendMode.softLight,BlendMode.difference,BlendMode.exclusion,
      BlendMode.multiply,BlendMode.hue,BlendMode.saturation,
      BlendMode.color, BlendMode.luminosity,
    ];

    var show = MultiShower(
      colorBlendModes, (mode) => Image.network(
      'https://raw.githubusercontent.com/flutter/flutter/master/dev/docs/favicon.ico',
      color: Colors.amber,
      colorBlendMode: mode,
    ),
      width: (Screen.screenWidth - 12*6)/5,
      height: (Screen.screenWidth - 12*6)/5,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Blend Test Page"),
      ),
      body: show,
    );
  }
}
