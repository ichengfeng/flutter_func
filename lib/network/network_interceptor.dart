import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

class NetworkInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    ///todo get token from cache
    // options.headers["Set-Cookie"] =
    //     "acw_tc=2f624a2916528428535868286e0d56f788845d1ac6940625a3dbd4a4a7c3be;path=/;HttpOnly;Max-Age=18000";
    options.headers["sso"] =
        "Wmeimob_eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1NjQ4OSMsIzEjLCMyMTguNzUuMzUuMjU0IywjYzFmNzQxNmVhYmE4NDA5OWI3OGRiZDk3OWMwMDdjOTQiLCJpc3MiOiJhdXRoMCIsImV4cCI6MzE0MjIzNTc0MX0.PxhfuUMnPkk1lUBVhS6xkig4f3s2VXRPBfUzdzNWyNs";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(dio.Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
