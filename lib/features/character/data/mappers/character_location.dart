import '../../domain/entities/character_location.dart';
import '../models/character_location_model.dart';

extension CharacterLocationModelMapper on CharacterLocationModel {
  CharacterLocation toEntity() {
    return CharacterLocation(name: name, url: url);
  }
}

extension CharacterLocationEntityMapper on CharacterLocation {
  CharacterLocationModel toModel() {
    return CharacterLocationModel(name: name, url: url);
  }
}
