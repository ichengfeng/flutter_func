import 'dart:convert';
import 'package:flutter_func/network/json/json_convert_content.dart';

ApiResponse<T> $ApiResponseFromJson<T>(Map<String, dynamic> json) {
  final ApiResponse<T> apiResponseEntity = ApiResponse<T>();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    apiResponseEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['msg']);
  if (message != null) {
    apiResponseEntity.msg = message;
  }
  final T? data = jsonConvert.convert<T>(json['data']);
  if (data != null) {
    apiResponseEntity.data = data;
  }
  return apiResponseEntity;
}

Map<String, dynamic> $ApiResponseToJson(ApiResponse entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data;
  return data;
}

class ApiResponse<T> {
  int? code;
  String? msg;
  T? data;

  ApiResponse();

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      $ApiResponseFromJson<T>(json);

  Map<String, dynamic> toJson() => $ApiResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
