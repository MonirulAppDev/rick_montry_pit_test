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
  Future<Either<BaseResponse, List<Character>>> getAllCharacters(
    int page, {
    String? name,
    String? status,
    String? species,
  }) async {
    try {
      final remoteCharacters = await remoteDataSource.getAllCharacters(
        page,
        name: name,
        status: status,
        species: species,
      );
      
      await localDataSource.cacheCharacters(remoteCharacters);
      
      final entities = remoteCharacters.map((model) => model.toEntity()).toList();
      return Right(_applyOverrides(entities));
    } catch (e, stackTrace) {
      final bool isConnected = await networkInfo.isConnected;
      
      if (!isConnected) {
        try {
          final localCharacters = await localDataSource.getLastCharacters();
          if (localCharacters.isNotEmpty) {
            var filteredEntities = localCharacters.map((model) => model.toEntity()).toList();
            
            // Apply filters locally if offline
            if (name != null) {
              filteredEntities = filteredEntities.where((c) => c.name.toLowerCase().contains(name.toLowerCase())).toList();
            }
            if (status != null) {
              filteredEntities = filteredEntities.where((c) => c.status.toLowerCase() == status.toLowerCase()).toList();
            }
            if (species != null) {
              filteredEntities = filteredEntities.where((c) => c.species.toLowerCase().contains(species.toLowerCase())).toList();
            }

            // Local pagination (simulated)
            final int startIndex = (page - 1) * 20;
            if (startIndex < filteredEntities.length) {
              final int endIndex = (startIndex + 20) > filteredEntities.length ? filteredEntities.length : startIndex + 20;
              final paginatedEntities = filteredEntities.sublist(startIndex, endIndex);
              return Right(_applyOverrides(paginatedEntities));
            } else {
              return const Right([]); // No more pages offline
            }
          }
        } catch (_) {}
        return Left(ErrorHandler.error('No internet connection', stackTrace));
      }
      
      return Left(ErrorHandler.error(e, stackTrace));
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

  @override
  Future<Either<BaseResponse, void>> deleteCharacterOverride(int id) async {
    try {
      await overrideDataSource.deleteOverride(id);
      return const Right(null);
    } catch (e, stackTrace) {
      return Left(ErrorHandler.error(e, stackTrace));
    }
  }
}
