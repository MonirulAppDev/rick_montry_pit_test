import 'package:dartz/dartz.dart';
import '../../../../core/common/models/base_response.dart';
import '../entities/character.dart';

abstract class CharacterRepository {
  Future<Either<BaseResponse, List<Character>>> getAllCharacters(int page);
}
