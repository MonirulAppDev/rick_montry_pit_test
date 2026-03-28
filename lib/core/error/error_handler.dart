import 'package:dio/dio.dart';

import '../common/models/base_response.dart';

class ErrorHandler {
  static BaseResponse<T> error<T>(Object? error, StackTrace? stackTrace) {
    if (error is DioException) {
      String message = 'Unexpected network error';
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          message = 'Network timeout. Please slow down and try again.';
          break;
        case DioExceptionType.badResponse:
          message = error.response?.statusMessage ?? 'Server Error';
          break;
        case DioExceptionType.cancel:
          message = 'Request cancelled';
          break;
        case DioExceptionType.connectionError:
          message = 'Could not connect to the server.';
          break;
        default:
          message = error.message ?? 'Unknown error occurred.';
      }
      return BaseResponse(
        statusCode: error.response?.statusCode ?? 501,
        message: message,
      );
    }
    
    if (error is String) {
      return BaseResponse(statusCode: 501, message: error);
    }
    
    return BaseResponse(statusCode: 501, data: null, message: 'An unexpected error occurred.');
  }
}
