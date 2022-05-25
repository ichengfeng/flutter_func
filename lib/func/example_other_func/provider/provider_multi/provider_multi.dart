import 'package:flutter/material.dart';
import 'package:itools/log.dart';
import 'package:provider/provider.dart';

import '../model/user_info.dart';
import '../view_model/counter_view_model.dart';
import '../view_model/user_view_model.dart';

class ProviderMultiPage extends StatefulWidget {
  static const String routeName = "/provider_multi";
  const ProviderMultiPage({Key? key}) : super(key: key);

  @override
  State<ProviderMultiPage> createState() => _ProviderMultiState();
}

class _ProviderMultiState extends State<ProviderMultiPage> {

  @override
  Widget build(BuildContext context) {
    printf("Super ==== ");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx)=>CounterViewModel(),),
        ChangeNotifierProvider(create: (ctx)=>UserViewModel(UserInfo('cf',20,'url')),)
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("列表测试"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CFShowData01(),
              CFShowData02(),
              CFShowData03(),
              CFShowData04(),
              CFShowData05(),
            ],
          ),
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

class CFShowData01 extends StatelessWidget {
  const CFShowData01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ///3、在其他位置使用共享数据
    int counter = Provider.of<CounterViewModel>(context).counter;

    return Container(
      color: Colors.red,
      child: Text('当前计数：$counter',style: const TextStyle(fontSize: 30),),
    );
  }
}

class CFShowData02 extends StatelessWidget {
  const CFShowData02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Consumer<CounterViewModel>(
        builder: (ctx, countVM, child){
          return Text(
            '当前计数：${countVM.counter}',
            style: const TextStyle(fontSize: 30),
          );
        },
      ),
    );
  }
}


class CFShowData03 extends StatelessWidget {
  const CFShowData03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(builder: (ctx, userVM,child){
      return Text('nickname:${userVM.user.nickname}',style: const TextStyle(fontSize: 30),);
    });
  }

}

class CFShowData04 extends StatelessWidget {
  const CFShowData04({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserViewModel,CounterViewModel>(builder: (ctx, userVM, counterVM, child){
      return Text(
        'nickname:${userVM.user.nickname} counter:${counterVM.counter}',
        style: const TextStyle(fontSize: 30),
      );
    });
  }

}

class CFShowData05 extends StatelessWidget {
  const CFShowData05({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${context.watch<CounterViewModel>().counter}",
      style: const TextStyle(
        color: Colors.red,
        fontSize: 18
      ),
    );
  }
}
