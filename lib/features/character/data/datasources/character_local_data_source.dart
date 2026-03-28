import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/error/exceptions.dart';
import '../models/character_model.dart';

abstract class CharacterLocalDataSource {
  Future<List<CharacterModel>> getLastCharacters();
  Future<void> cacheCharacters(List<CharacterModel> charactersToCache);
  Future<CharacterModel?> getCharacterById(int id);
}

const _cachedCharacters = 'CACHED_CHARACTERS';

class CharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  final Box box;

  CharacterLocalDataSourceImpl({required this.box});

  @override
  Future<void> cacheCharacters(List<CharacterModel> charactersToCache) async {
    final existingJson = box.get(_cachedCharacters);
    List<CharacterModel> allCharacters = [];

    if (existingJson != null) {
      final List decoded = json.decode(existingJson);
      allCharacters = decoded.map((item) => CharacterModel.fromJson(item)).toList();
    }

    final characterMap = {for (var c in allCharacters) c.id: c};
    for (var char in charactersToCache) {
      characterMap[char.id] = char;
    }

    final mergedList = characterMap.values.toList();
    final jsonList = mergedList.map((character) => character.toJson()).toList();
    await box.put(_cachedCharacters, json.encode(jsonList));
  }

  @override
  Future<List<CharacterModel>> getLastCharacters() async {
    final jsonString = box.get(_cachedCharacters);
    if (jsonString != null) {
      final List decoded = json.decode(jsonString);
      return decoded.map((item) => CharacterModel.fromJson(item)).toList();
    } else {
      throw CacheException();
    }
  }

  @override
  Future<CharacterModel?> getCharacterById(int id) async {
    final jsonString = box.get(_cachedCharacters);
    if (jsonString != null) {
      final List decoded = json.decode(jsonString);
      final characters = decoded.map((item) => CharacterModel.fromJson(item)).toList();
      try {
        return characters.firstWhere((element) => element.id == id);
      } catch (_) {
        return null;
      }
    }
    return null;
  }
}
