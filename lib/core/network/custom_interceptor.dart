import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('--- REQUEST ---');
    log('URL: ${options.baseUrl}${options.path}');
    log('Method: ${options.method}');
    log('Headers: ${options.headers}');
    if (options.data != null) log('Data: ${jsonEncode(options.data)}');
    log('---------------');

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('--- RESPONSE ---');
    log(
      'URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}',
    );
    log('Status Code: ${response.statusCode}');

    final dynamic originalData = response.data;

    // Rick and Morty API returns results in a 'results' field.
    // We extract it so BaseResponse<List<T>> gets the actual list.
    dynamic dataToWrap = originalData;
    if (originalData is Map && originalData.containsKey('results')) {
      dataToWrap = originalData['results'];
    }

    final wrappedData = {
      "data": dataToWrap,
      "status_code": response.statusCode ?? 0,
      "message": response.statusMessage ?? "",
    };

    response.data = wrappedData;

    log('Wrapped Data: ${jsonEncode(response.data)}');
    log('----------------');

    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('--- ERROR ---');
    log('URL: ${err.requestOptions.baseUrl}${err.requestOptions.path}');
    log('Status Code: ${err.response?.statusCode}');
    log('Error: ${err.message}');
    log('-------------');

    return handler.next(err);
  }
}
