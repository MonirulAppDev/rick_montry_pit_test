import 'package:dartz/dartz.dart';
import 'package:rick_montry_pit_test/core/common/models/base_response.dart';
import 'package:rick_montry_pit_test/core/error/error_handler.dart';
import 'package:rick_montry_pit_test/features/character/data/mappers/character_mapper.dart';
import 'package:rick_montry_pit_test/features/character/domain/entities/character.dart';
import 'package:rick_montry_pit_test/features/character/domain/repositories/favorite_repository.dart';
import 'package:rick_montry_pit_test/features/character/data/datasources/favorite_local_data_source.dart';
import 'package:rick_montry_pit_test/features/character/data/datasources/character_override_local_data_source.dart';
import 'package:rick_montry_pit_test/features/character/data/datasources/character_local_data_source.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDataSource localDataSource;
  final CharacterOverrideLocalDataSource overrideDataSource;
  final CharacterLocalDataSource characterLocalDataSource;

  FavoriteRepositoryImpl({
    required this.localDataSource,
    required this.overrideDataSource,
    required this.characterLocalDataSource,
  });

  List<Character> _applyOverrides(List<Character> characters) {
    return characters.map((character) {
      if (overrideDataSource.hasOverride(character.id)) {
        final override = overrideDataSource.getOverride(character.id);
        if (override != null) {
          return override.toEntity();
        }
      }
      return character;
    }).toList();
  }

  @override
  Future<Either<BaseResponse, void>> toggleFavorite(Character character) async {
    try {
      if (localDataSource.isFavorite(character.id)) {
        await localDataSource.removeFavorite(character.id);
      } else {
        // Fetch the base model from cache to ensure favorites only store base data
        // Overrides will be applied at runtime in getFavoriteCharacters
        final baseModel = await characterLocalDataSource.getCharacterById(character.id);
        if (baseModel != null) {
          await localDataSource.saveFavorite(baseModel);
        } else {
          // Fallback if not found in base cache (though it should be there)
          await localDataSource.saveFavorite(character.toModel());
        }
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
      return Right(_applyOverrides(entities));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.error(e, stackTrace));
    }
  }

  @override
  bool isFavorite(int id) {
    return localDataSource.isFavorite(id);
  }
}
