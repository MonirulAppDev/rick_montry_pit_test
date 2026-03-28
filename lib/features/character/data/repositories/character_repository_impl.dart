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
    try {
      // 1. Try to fetch from remote
      final remoteCharacters = await remoteDataSource.getAllCharacters();
      
      // 2. If successful, cache the data for future offline use
      await localDataSource.cacheCharacters(remoteCharacters);
      
      final entities = remoteCharacters.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e, stackTrace) {
      // 3. On any failure (e.g., no internet, timeout), attempt to get local cached data
      try {
        final localCharacters = await localDataSource.getLastCharacters();
        final entities = localCharacters.map((model) => model.toEntity()).toList();
        return Right(entities);
      } catch (_) {
        // 4. If local fetch also fails (no cache), return the original error to the user
        return Left(ErrorHandler.error(e, stackTrace));
      }
    }
  }
}
