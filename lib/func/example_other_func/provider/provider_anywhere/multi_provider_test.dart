import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/counter_view_model.dart';
import '../view_model/user_view_model.dart';

class MultiProviderTestPage extends StatelessWidget {
  const MultiProviderTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///3、在其他位置使用共享数据
    // int counter = Provider.of<CounterViewModel>(context).counter;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: Center(
        child: Container(
          color: Colors.red,
          // child: const CFShowData02(),
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
