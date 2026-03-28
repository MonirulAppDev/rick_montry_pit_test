import 'package:dartz/dartz.dart';
import '../../../../core/common/models/base_response.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/character.dart';
import '../../domain/repositories/character_repository.dart';
import '../datasources/character_local_data_source.dart';
import '../datasources/character_remote_data_source.dart';
import '../mappers/character_mapper.dart';
import '../datasources/character_override_local_data_source.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;
  final CharacterLocalDataSource localDataSource;
  final CharacterOverrideLocalDataSource overrideDataSource;
  final NetworkInfo networkInfo;

  CharacterRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.overrideDataSource,
    required this.networkInfo,
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
  Future<Either<BaseResponse, List<Character>>> getAllCharacters(int page) async {
    final bool isConnected = await networkInfo.isConnected;
    
    if (isConnected) {
      try {
        final remoteCharacters = await remoteDataSource.getAllCharacters(page);
        
        await localDataSource.cacheCharacters(remoteCharacters);
        
        final entities = remoteCharacters.map((model) => model.toEntity()).toList();
        return Right(_applyOverrides(entities));
      } catch (e, stackTrace) {
        // Fallback to local cache only for the first page
        if (page == 1) {
          try {
            final localCharacters = await localDataSource.getLastCharacters();
            final entities = localCharacters.map((model) => model.toEntity()).toList();
            return Right(_applyOverrides(entities));
          } catch (_) {}
        }
        return Left(ErrorHandler.error(e, stackTrace));
      }
    } else {
      // If no internet and asking for first page, show the entire local cache
      if (page == 1) {
        try {
          final localCharacters = await localDataSource.getLastCharacters();
          final entities = localCharacters.map((model) => model.toEntity()).toList();
          return Right(_applyOverrides(entities));
        } catch (e, stackTrace) {
          return Left(ErrorHandler.error(e, stackTrace));
        }
      }
      // If no internet and asking for more pages, return error
      return Left(ErrorHandler.error('No internet connection', StackTrace.current));
    }
  }

  @override
  Future<Either<BaseResponse, void>> updateCharacterOverride(Character character) async {
    try {
      await overrideDataSource.saveOverride(character.toModel());
      return const Right(null);
    } catch (e, stackTrace) {
      return Left(ErrorHandler.error(e, stackTrace));
    }
  }
}
