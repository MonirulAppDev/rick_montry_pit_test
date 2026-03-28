import 'package:dio/dio.dart';

import '../common/models/base_response.dart';

class ErrorHandler {
  static BaseResponse<T> error<T>(Object? error, StackTrace? stackTrace) {
    switch (error.runtimeType) {
      case DioException _:
        final res = (error as DioException).response;
        return BaseResponse(
          statusCode: res?.statusCode ?? 501,
          message: res?.statusMessage ?? '',
        );
      default:
        return BaseResponse(statusCode: 501);
    }
  }
}
