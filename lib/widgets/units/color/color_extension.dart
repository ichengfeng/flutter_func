import 'package:flutter/material.dart';
import 'package:itools/log.dart';

/*
* hexStr: #333333或333333
* */
Color colorWithHexString(String hexStr) {
  if(hexStr.contains("#")) {
    int index = hexStr.indexOf("#");
    String tempStr = hexStr.replaceRange(index, index+1,"");
    tempStr = "0xFF" + tempStr;
    return Color(int.parse(tempStr));
  }
  return Color(int.parse('0xFF'+hexStr));
}