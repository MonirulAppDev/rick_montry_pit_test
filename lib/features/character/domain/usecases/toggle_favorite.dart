import 'package:dartz/dartz.dart';
import '../../../../core/common/models/base_response.dart';
import '../entities/character.dart';
import '../repositories/favorite_repository.dart';

class ToggleFavorite {
  final FavoriteRepository repository;

  ToggleFavorite(this.repository);

  Future<Either<BaseResponse, void>> call(Character character) async {
    return await repository.toggleFavorite(character);
  }
}
