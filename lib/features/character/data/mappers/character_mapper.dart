import '../../domain/entities/character.dart';
import '../models/character_model.dart';
import 'character_location.dart';

extension CharacterModelMapper on CharacterModel {
  Character toEntity() {
    return Character(
      id: id,
      name: name,
      status: status,
      species: species,
      image: image,
      type: type,
      gender: gender,
      url: url,
      created: created,
      origin: origin.toEntity(),
      location: location.toEntity(),
      episode: episode,
    );
  }
}

extension CharacterEntityMapper on Character {
  CharacterModel toModel() {
    return CharacterModel(
      id: id,
      name: name,
      status: status,
      species: species,
      image: image,
      type: type,
      gender: gender,
      url: url,
      created: created,
      origin: origin.toModel(),
      location: location.toModel(),
      episode: episode,
    );
  }
}
