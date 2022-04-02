import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewTestPage extends StatelessWidget {
  static const String routerName = "webview_test";

  const WebViewTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView Test'),
      ),
      body: WebView(
        backgroundColor: Colors.grey,
        navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
        initialUrl: 'https://picsum.photos/',
      ),
    );
  }
}
