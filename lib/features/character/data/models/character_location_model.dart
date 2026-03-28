import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_location_model.freezed.dart';
part 'character_location_model.g.dart';

@freezed
abstract class CharacterLocationModel with _$CharacterLocationModel {
  const factory CharacterLocationModel({
    required String name,
    required String url,
  }) = _CharacterLocationModel;

  factory CharacterLocationModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationModelFromJson(json);
}
