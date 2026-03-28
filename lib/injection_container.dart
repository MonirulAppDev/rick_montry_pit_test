import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rick_montry_pit_test/core/network/api_client.dart';
import 'package:rick_montry_pit_test/core/network/custom_interceptor.dart';
import 'package:rick_montry_pit_test/core/network/network_info.dart';
import 'package:rick_montry_pit_test/features/character/data/datasources/character_local_data_source.dart';
import 'package:rick_montry_pit_test/features/character/data/datasources/character_remote_data_source.dart';
import 'package:rick_montry_pit_test/features/character/data/repositories/character_repository_impl.dart';
import 'package:rick_montry_pit_test/features/character/domain/repositories/character_repository.dart';
import 'package:rick_montry_pit_test/features/character/domain/usecases/delete_character_override.dart';
import 'package:rick_montry_pit_test/features/character/domain/usecases/get_all_characters.dart';
import 'package:rick_montry_pit_test/features/character/data/datasources/favorite_local_data_source.dart';
import 'package:rick_montry_pit_test/features/character/data/repositories/favorite_repository_impl.dart';
import 'package:rick_montry_pit_test/features/character/domain/repositories/favorite_repository.dart';
import 'package:rick_montry_pit_test/features/character/domain/usecases/toggle_favorite.dart';
import 'package:rick_montry_pit_test/features/character/domain/usecases/get_favorite_characters.dart';
import 'package:rick_montry_pit_test/features/character/data/datasources/character_override_local_data_source.dart';
import 'package:rick_montry_pit_test/features/character/domain/usecases/update_character_override.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final baseUrl = dotenv.get('BASE_URL');

  // Network Info
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Hive
  final characterBox = Hive.box('characters');
  final favoritesBox = Hive.box('favorites');
  final overridesBox = Hive.box('character_overrides');
  sl.registerLazySingleton(() => characterBox);
  sl.registerLazySingleton(() => favoritesBox, instanceName: 'favorites');
  sl.registerLazySingleton(() => overridesBox, instanceName: 'overrides');

  // Dio
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  dio.interceptors.add(CustomInterceptors());
  sl.registerLazySingleton(() => dio);

  // Api Client
  sl.registerLazySingleton(() => ApiClient(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetAllCharacters(sl()));
  sl.registerLazySingleton(() => ToggleFavorite(sl()));
  sl.registerLazySingleton(() => GetFavoriteCharacters(sl()));
  sl.registerLazySingleton(() => UpdateCharacterOverride(sl()));
  sl.registerLazySingleton(() => DeleteCharacterOverride(sl()));

  // Repository
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      overrideDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(
      localDataSource: sl(),
      overrideDataSource: sl(),
      characterLocalDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSourceImpl(apiClient: sl()),
  );

  sl.registerLazySingleton<CharacterLocalDataSource>(
    () => CharacterLocalDataSourceImpl(box: sl()),
  );

  sl.registerLazySingleton<FavoriteLocalDataSource>(
    () => FavoriteLocalDataSourceImpl(box: sl(instanceName: 'favorites')),
  );

  sl.registerLazySingleton<CharacterOverrideLocalDataSource>(
    () => CharacterOverrideLocalDataSourceImpl(
      box: sl(instanceName: 'overrides'),
    ),
  );
}
