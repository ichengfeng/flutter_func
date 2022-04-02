import 'package:flutter/material.dart';
import 'package:flutter_func/func/provider/view_model/counter_view_model.dart';
import 'package:provider/provider.dart';

class ProviderSinglePage extends StatelessWidget {
  static const String routeName = "/provider_single";

  const ProviderSinglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return CounterViewModel();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Provider Test"),
        ),
        body: const Center(
          child: ShowData(),
        ),
        floatingActionButton: Selector<CounterViewModel, CounterViewModel>(
          selector: (ctx, counterVM) => counterVM,
          shouldRebuild: (prev, next) => false,
          builder:(ctx, countVM, child){
            return FloatingActionButton(
              child: child,
              onPressed: (){
                countVM.counter += 1;
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class ShowData extends StatelessWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ///3、在其他位置使用共享数据
    int counter = Provider.of<CounterViewModel>(context).counter;

    return Container(
      color: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text('当前计数：$counter',style: const TextStyle(fontSize: 30),),
      ),
    );
  }
}
