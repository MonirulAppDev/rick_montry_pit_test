import 'package:dartz/dartz.dart';
import '../../../../core/common/models/base_response.dart';
import '../repositories/character_repository.dart';

class DeleteCharacterOverride {
  final CharacterRepository repository;

  DeleteCharacterOverride(this.repository);

  Future<Either<BaseResponse, void>> call(int id) async {
    return await repository.deleteCharacterOverride(id);
  }
}
