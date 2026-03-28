import 'package:dartz/dartz.dart';
import '../../../../core/common/models/base_response.dart';
import '../entities/character.dart';
import '../repositories/character_repository.dart';

class GetAllCharacters {
  final CharacterRepository repository;

  GetAllCharacters(this.repository);

  Future<Either<BaseResponse, List<Character>>> call({
    int page = 1,
    String? name,
    String? status,
    String? species,
  }) async {
    return await repository.getAllCharacters(
      page,
      name: name,
      status: status,
      species: species,
    );
  }
}
