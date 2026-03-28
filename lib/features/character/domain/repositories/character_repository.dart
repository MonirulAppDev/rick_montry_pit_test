import 'package:dartz/dartz.dart';
import '../../../../core/common/models/base_response.dart';
import '../entities/character.dart';

abstract class CharacterRepository {
  Future<Either<BaseResponse, List<Character>>> getAllCharacters(
    int page, {
    String? name,
    String? status,
    String? species,
  });
  Future<Either<BaseResponse, void>> updateCharacterOverride(Character character);
  Future<Either<BaseResponse, void>> deleteCharacterOverride(int id);
}
