import 'package:dartz/dartz.dart';
import 'package:rick_montry_pit_test/core/common/models/base_response.dart';
import 'package:rick_montry_pit_test/features/character/domain/entities/character.dart';
import 'package:rick_montry_pit_test/features/character/domain/repositories/character_repository.dart';

class UpdateCharacterOverride {
  final CharacterRepository repository;

  UpdateCharacterOverride(this.repository);

  Future<Either<BaseResponse, void>> call(Character character) async {
    return await repository.updateCharacterOverride(character);
  }
}
