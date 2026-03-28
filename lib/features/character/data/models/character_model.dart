import 'package:freezed_annotation/freezed_annotation.dart';
import 'character_location_model.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
abstract class CharacterModel with _$CharacterModel {
  const factory CharacterModel({
    required int id,
    required String name,
    required String status,
    required String species,
    required String image,
    required String type,
    required String gender,
    required String url,
    required String created,
    required CharacterLocationModel origin,
    required CharacterLocationModel location,
    required List<String> episode,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
}
