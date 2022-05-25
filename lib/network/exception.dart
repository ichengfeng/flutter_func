import 'package:dio/dio.dart';
import 'package:flutter_func/network/api/api_response.dart';

class ApiException implements Exception {
  static const unknownException = "未知错误";
  final String? message;
  final int? code;
  String? stackInfo;
  String? requestUrl;

  ApiException([this.requestUrl, this.code, this.message]);

  factory ApiException.fromDioError(DioError error) {
    final requestUrl = error.requestOptions.uri.toString();
    switch (error.type) {
      case DioErrorType.cancel:
        return BadRequestException(requestUrl, -1, "请求取消");
      case DioErrorType.connectTimeout:
        return BadRequestException(requestUrl, -1, "连接超时");
      case DioErrorType.sendTimeout:
        return BadRequestException(requestUrl, -1, "请求超时");
      case DioErrorType.receiveTimeout:
        return BadRequestException(requestUrl, -1, "响应超时");
      case DioErrorType.response:
        try {
          /// http错误码带业务错误信息
          if (error.response?.data != null) {
            if (error.response!.data is Map) {
              ApiResponse apiResponse =
                  ApiResponse.fromJson(error.response?.data);
              if (apiResponse.code != null) {
                return ApiException(
                    requestUrl, apiResponse.code, apiResponse.msg);
              }
            } else {
              return ApiException(
                  requestUrl, error.response!.statusCode, error.message);
            }
          }

          int? errCode = error.response?.statusCode;
          switch (errCode) {
            case 400:
              return BadRequestException(requestUrl, errCode, "请求语法错误");
            case 401:
              return UnauthorisedException(requestUrl, errCode!, "没有权限");
            case 403:
              return UnauthorisedException(requestUrl, errCode!, "服务器拒绝执行");
            case 404:
              return UnauthorisedException(requestUrl, errCode!, "无法连接服务器");
            case 405:
              return UnauthorisedException(requestUrl, errCode!, "请求方法被禁止");
            case 500:
              return UnauthorisedException(requestUrl, errCode!, "服务器内部错误");
            case 502:
              return UnauthorisedException(requestUrl, errCode!, "无效的请求");
            case 503:
              return UnauthorisedException(requestUrl, errCode!, "服务器异常");
            case 505:
              return UnauthorisedException(requestUrl, errCode!, "不支持HTTP协议请求");
            default:
              return ApiException(
                  requestUrl, errCode, error.response?.statusMessage ?? '未知错误');
          }
        } on Exception catch (_) {
          return ApiException(requestUrl, -1, unknownException);
        }
      default:
        return ApiException(requestUrl, -1, error.message);
    }
  }

  factory ApiException.from(String? requestUrl, dynamic exception) {
    if (exception is DioError) {
      return ApiException.fromDioError(exception);
    }
    if (exception is ApiException) {
      return exception;
    } else {
      var apiException = ApiException(requestUrl, -1, unknownException);
      apiException.stackInfo = exception?.toString();
      return apiException;
    }
  }

  @override
  String toString() {
    return '\n==========Network Error======================\n|| url: $requestUrl,\n|| codeL $code,\n|| message: $message,\n|| stackInfo: $stackInfo\n======================================';
  }
}

/// 请求错误
class BadRequestException extends ApiException {
  BadRequestException([String? requestUrl, int? code, String? message])
      : super(requestUrl, code, message);
}

/// 未认证异常
class UnauthorisedException extends ApiException {
  UnauthorisedException(
      [String? requestUrl, int code = -1, String message = ''])
      : super(requestUrl, code, message);
}
