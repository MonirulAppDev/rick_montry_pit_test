import 'package:dartz/dartz.dart';
import '../../../../core/common/models/base_response.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/character.dart';
import '../../domain/repositories/character_repository.dart';
import '../datasources/character_local_data_source.dart';
import '../datasources/character_remote_data_source.dart';
import '../mappers/character_mapper.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;
  final CharacterLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CharacterRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<BaseResponse, List<Character>>> getAllCharacters() async {
    final bool isConnected = await networkInfo.isConnected;
    
    if (isConnected) {
      try {
        final remoteCharacters = await remoteDataSource.getAllCharacters();
        await localDataSource.cacheCharacters(remoteCharacters);
        final entities = remoteCharacters.map((model) => model.toEntity()).toList();
        return Right(entities);
      } catch (e, stackTrace) {
        // Even if connected, remote fetch might fail (timeout, server error, etc.)
        // Fallback to local cache
        try {
          final localCharacters = await localDataSource.getLastCharacters();
          final entities = localCharacters.map((model) => model.toEntity()).toList();
          return Right(entities);
        } catch (_) {
          return Left(ErrorHandler.error(e, stackTrace));
        }
      }
    } else {
      // Not connected, immediately go to local cache
      try {
        final localCharacters = await localDataSource.getLastCharacters();
        final entities = localCharacters.map((model) => model.toEntity()).toList();
        return Right(entities);
      } catch (e, stackTrace) {
        // No internet and no cache
        return Left(ErrorHandler.error(e, stackTrace));
      }
    }
  }
}
