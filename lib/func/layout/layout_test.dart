import 'package:flutter/material.dart';
class LayoutTestPage extends StatelessWidget {

  static const String routerName = "layout_test";

  const LayoutTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CustomMultiChildLayout"),
      ),
      body: CustomMultiChildLayout(
        delegate: MyDelegate(),
        children: [
          LayoutId(
            id: 1,
            child: const FlutterLogo(),
          ),
          LayoutId(
            id: 2,
            child: const FlutterLogo(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    if(hasChild(1)) {
      final size1 = layoutChild(
        1,
        const BoxConstraints(
          minWidth: 100,
          minHeight: 100,
          maxWidth: 100,
          maxHeight: 100,
        ),
      );
    }
    if(hasChild(2)) {
      final size1 = layoutChild(
        2,
        const BoxConstraints(
          minWidth: 200,
          minHeight: 200,
          maxWidth: 200,
          maxHeight: 200,
        ),
      );
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {

    throw UnimplementedError();
  }

}
