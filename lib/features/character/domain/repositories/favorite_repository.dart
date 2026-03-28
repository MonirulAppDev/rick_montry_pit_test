import 'package:dartz/dartz.dart';
import '../../../../core/common/models/base_response.dart';
import '../entities/character.dart';

abstract class FavoriteRepository {
  Future<Either<BaseResponse, void>> toggleFavorite(Character character);
  Future<Either<BaseResponse, List<Character>>> getFavoriteCharacters();
  bool isFavorite(int id);
}
