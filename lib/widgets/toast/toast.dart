import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static void showToast(String msg,{int? duration}) {
    BotToast.showText(
      text: msg,
      align: Alignment.center,
      duration: Duration(seconds: duration ?? 3),
      animationDuration: Duration.zero,
      borderRadius: const BorderRadius.all(Radius.circular(4)),
    );
  }

  /*自定义toast，出现时内容不可点击*/
  static showCustomToast(String msg,{int? duration}) {
    BotToast.showAnimationWidget(
      duration: Duration(seconds: duration ?? 3),
      animationDuration: Duration.zero,
      ignoreContentClick: true,
      allowClick: false,
      onlyOne: true,
      toastBuilder: (void Function() cancelFunc){
        return Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(msg,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        );
      },
    );
  }
}

