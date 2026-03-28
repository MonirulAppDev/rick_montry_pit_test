import 'package:dartz/dartz.dart';
import '../../../../core/common/models/base_response.dart';
import '../entities/character.dart';
import '../repositories/favorite_repository.dart';

class GetFavoriteCharacters {
  final FavoriteRepository repository;

  GetFavoriteCharacters(this.repository);

  Future<Either<BaseResponse, List<Character>>> call() async {
    return await repository.getFavoriteCharacters();
  }
}
