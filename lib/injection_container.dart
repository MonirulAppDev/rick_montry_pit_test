import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rick_montry_pit_test/core/network/api_client.dart';
import 'package:rick_montry_pit_test/core/network/custom_interceptor.dart';
import 'package:rick_montry_pit_test/core/network/network_info.dart';
import 'features/character/data/datasources/character_local_data_source.dart';
import 'features/character/data/datasources/character_remote_data_source.dart';
import 'features/character/data/repositories/character_repository_impl.dart';
import 'features/character/domain/repositories/character_repository.dart';
import 'features/character/domain/usecases/get_all_characters.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final baseUrl = dotenv.get('BASE_URL');

  // Network Info
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Hive
  final characterBox = Hive.box('characters');
  sl.registerLazySingleton(() => characterBox);

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

  // Repository
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSourceImpl(apiClient: sl()),
  );

  sl.registerLazySingleton<CharacterLocalDataSource>(
    () => CharacterLocalDataSourceImpl(box: sl()),
  );
}
