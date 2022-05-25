import 'package:dio/dio.dart';

/*
  "data": {
		"pageNum": 1,
		"pageSize": 10,
		"size": 1,
		"startRow": 1,
		"endRow": 1,
		"total": 1,
		"pages": 1,
		"list": [],
    }
*/
class ResponseModel<T> {
  Response? response;
  String? message;
  int code = 0;
  T? data;

  List<T>? datas;

  ResponseModel.empty();

  bool get success {
    return code >= 200 && code < 400;
  }

  /// 是否存在下一页
  bool get hasNext {
    if (response!.data != null &&
        response!.data is Map &&
        response!.data['data'] != null) {
      final endRow = response!.data['data']['endRow'] ?? 0;
      final total = response!.data['data']['total'] ?? 0;
      return endRow < total ? true : false;
    }
    return false;
  }

  @override
  String toString() {
    return '''===================== response model:
[code]: $code,
[message]: $message,
[data]: ${data ?? datas},
[details]: ${() {
      if (data == null && datas == null) {
        return response?.data;
      } else {
        return '';
      }
    }()}


''';
  }
}
