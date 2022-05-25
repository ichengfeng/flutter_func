import 'package:flutter/material.dart';
import 'package:flutter_func/func/provider/provider_anywhere/multi_provider_test.dart';
import 'package:provider/provider.dart';

import '../model/user_info.dart';
import '../view_model/counter_view_model.dart';
import '../view_model/user_view_model.dart';

class ProviderAnywherePage extends StatelessWidget {
  const ProviderAnywherePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx)=>CounterViewModel(),),
        ChangeNotifierProvider(create: (ctx)=>UserViewModel(UserInfo('cf',20,'url')),)
      ],
      child: MaterialApp(
        builder: (ctx,_){
          return Scaffold(
            appBar: AppBar(
              title: const Text('Provider Test'),
              leading: IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.navigate_before),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Text("下一页"),
              onPressed: (){
                Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx){
                  return const MultiProviderTestPage();
                }));
              },
            ),
          );
        },
        // home: Builder(
        //   builder: (BuildContext ctx) {
        //     return Scaffold(
        //       appBar: AppBar(
        //         title: const Text('Provider Test'),
        //         leading: IconButton(
        //           onPressed: (){
        //             Navigator.of(context).pop();
        //           },
        //           icon: const Icon(Icons.navigate_before),
        //         ),
        //       ),
        //       floatingActionButton: FloatingActionButton(
        //         child: const Text("下一页"),
        //         onPressed: (){
        //           Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx){
        //             return const MultiProviderTestPage();
        //           }));
        //         },
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
