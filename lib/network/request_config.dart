import 'package:flutter/material.dart';
import 'package:flutter_func/network/network_env_route.dart';

class RequestConfig {
  static String get baseUrl {
    String env = NetworkEnv().current;
    String host;
    if (env == 'dev') {
      host = "https://shequ-dev.xinc818.com";
    } else if (env == 'gray') {
      host = "https://shequ-gray.xinc818.com";
    } else if (env == 'daily') {
      host = "https://shequ-daily.xinc818.com";
    } else if (env == 'mock') {
      host = 'http://127.0.0.1:4523/mock/968685';
    } else {
      host = "https://api.xinc818.com";
    }
    return host;
  }

  static const connectTimeout = 15000;
  static const successCode = 1000001;
}
