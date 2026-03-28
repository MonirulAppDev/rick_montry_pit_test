import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_montry_pit_test/features/character/data/models/character_model.dart';

abstract class FavoriteLocalDataSource {
  Future<void> saveFavorite(CharacterModel character);
  Future<void> removeFavorite(int id);
  Future<List<CharacterModel>> getFavorites();
  bool isFavorite(int id);
}

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  final Box box;

  FavoriteLocalDataSourceImpl({required this.box});

  @override
  Future<void> saveFavorite(CharacterModel character) async {
    await box.put(character.id.toString(), json.encode(character.toJson()));
  }

  @override
  Future<void> removeFavorite(int id) async {
    await box.delete(id.toString());
  }

  @override
  Future<List<CharacterModel>> getFavorites() async {
    final List<CharacterModel> favorites = [];
    for (var key in box.keys) {
      final jsonString = box.get(key);
      if (jsonString != null) {
        final decoded = json.decode(jsonString);
        favorites.add(CharacterModel.fromJson(decoded));
      }
    }
    return favorites;
  }

  @override
  bool isFavorite(int id) {
    return box.containsKey(id.toString());
  }
}
