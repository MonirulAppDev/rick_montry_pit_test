import 'package:dartz/dartz.dart';
import 'package:rick_montry_pit_test/core/common/models/base_response.dart';
import 'package:rick_montry_pit_test/core/error/error_handler.dart';
import 'package:rick_montry_pit_test/features/character/data/mappers/character_mapper.dart';
import 'package:rick_montry_pit_test/features/character/domain/entities/character.dart';
import 'package:rick_montry_pit_test/features/character/domain/repositories/favorite_repository.dart';
import 'package:rick_montry_pit_test/features/character/data/datasources/favorite_local_data_source.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDataSource localDataSource;

  FavoriteRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<BaseResponse, void>> toggleFavorite(Character character) async {
    try {
      if (localDataSource.isFavorite(character.id)) {
        await localDataSource.removeFavorite(character.id);
      } else {
        await localDataSource.saveFavorite(character.toModel());
      }
      return const Right(null);
    } catch (e, stackTrace) {
      return Left(ErrorHandler.error(e, stackTrace));
    }
  }

  @override
  Future<Either<BaseResponse, List<Character>>> getFavoriteCharacters() async {
    try {
      final models = await localDataSource.getFavorites();
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (e, stackTrace) {
      return Left(ErrorHandler.error(e, stackTrace));
    }
  }

  @override
  bool isFavorite(int id) {
    return localDataSource.isFavorite(id);
  }
}
