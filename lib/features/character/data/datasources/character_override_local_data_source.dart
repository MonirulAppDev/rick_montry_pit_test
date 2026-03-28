import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_montry_pit_test/features/character/data/models/character_model.dart';

abstract class CharacterOverrideLocalDataSource {
  Future<void> saveOverride(CharacterModel character);
  CharacterModel? getOverride(int id);
  bool hasOverride(int id);
}

class CharacterOverrideLocalDataSourceImpl implements CharacterOverrideLocalDataSource {
  final Box box;

  CharacterOverrideLocalDataSourceImpl({required this.box});

  @override
  Future<void> saveOverride(CharacterModel character) async {
    await box.put(character.id.toString(), json.encode(character.toJson()));
  }

  @override
  CharacterModel? getOverride(int id) {
    final jsonString = box.get(id.toString());
    if (jsonString != null) {
      final decoded = json.decode(jsonString);
      return CharacterModel.fromJson(decoded);
    }
    return null;
  }

  @override
  bool hasOverride(int id) {
    return box.containsKey(id.toString());
  }
}
