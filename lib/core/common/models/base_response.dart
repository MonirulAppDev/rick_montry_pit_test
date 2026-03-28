import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

/// ___Base Response___</br>
/// _Handle all the responses from the server_
@Freezed(genericArgumentFactories: true)
abstract class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    @JsonKey(name: 'results') T? data,
    @JsonKey(name: 'status_code') @Default(0) int statusCode,
    @Default('') String message,
  }) = _BaseResponse;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);
}
