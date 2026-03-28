// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    _CharacterModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      image: json['image'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      url: json['url'] as String,
      created: json['created'] as String,
      origin: CharacterLocationModel.fromJson(
        json['origin'] as Map<String, dynamic>,
      ),
      location: CharacterLocationModel.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
      episode: (json['episode'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CharacterModelToJson(_CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'image': instance.image,
      'type': instance.type,
      'gender': instance.gender,
      'url': instance.url,
      'created': instance.created,
      'origin': instance.origin,
      'location': instance.location,
      'episode': instance.episode,
    };
