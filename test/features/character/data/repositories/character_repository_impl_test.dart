import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_montry_pit_test/core/network/network_info.dart';
import 'package:rick_montry_pit_test/features/character/data/datasources/character_local_data_source.dart';
import 'package:rick_montry_pit_test/features/character/data/datasources/character_override_local_data_source.dart';
import 'package:rick_montry_pit_test/features/character/data/datasources/character_remote_data_source.dart';
import 'package:rick_montry_pit_test/features/character/data/models/character_model.dart';
import 'package:rick_montry_pit_test/features/character/data/models/character_location_model.dart';
import 'package:rick_montry_pit_test/features/character/data/repositories/character_repository_impl.dart';
import 'package:rick_montry_pit_test/features/character/domain/entities/character.dart';

import 'character_repository_impl_test.mocks.dart';

@GenerateMocks([
  CharacterRemoteDataSource,
  CharacterLocalDataSource,
  CharacterOverrideLocalDataSource,
  NetworkInfo,
])
void main() {
  late CharacterRepositoryImpl repository;
  late MockCharacterRemoteDataSource mockRemoteDataSource;
  late MockCharacterLocalDataSource mockLocalDataSource;
  late MockCharacterOverrideLocalDataSource mockOverrideDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockCharacterRemoteDataSource();
    mockLocalDataSource = MockCharacterLocalDataSource();
    mockOverrideDataSource = MockCharacterOverrideLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = CharacterRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      overrideDataSource: mockOverrideDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final tCharacterModel = CharacterModel(
    id: 1,
    name: 'Rick Sanchez',
    status: 'Alive',
    species: 'Human',
    type: '',
    gender: 'Male',
    origin: const CharacterLocationModel(name: 'Earth', url: ''),
    location: const CharacterLocationModel(name: 'Earth', url: ''),
    image: '',
    episode: [],
    url: '',
    created: '',
  );

  group('getAllCharacters', () {
    test('should check if the device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getAllCharacters(any, name: anyNamed('name'), status: anyNamed('status'), species: anyNamed('species')))
          .thenAnswer((_) async => [tCharacterModel]);
      when(mockLocalDataSource.cacheCharacters(any)).thenAnswer((_) async => {});
      when(mockOverrideDataSource.hasOverride(any)).thenReturn(false);

      await repository.getAllCharacters(1);

      verify(mockNetworkInfo.isConnected);
    });

    test('should return remote data when the call to remote data source is successful', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getAllCharacters(any, name: anyNamed('name'), status: anyNamed('status'), species: anyNamed('species')))
          .thenAnswer((_) async => [tCharacterModel]);
      when(mockLocalDataSource.cacheCharacters(any)).thenAnswer((_) async => {});
      when(mockOverrideDataSource.hasOverride(any)).thenReturn(false);

      final result = await repository.getAllCharacters(1);

      verify(mockRemoteDataSource.getAllCharacters(1));
      expect(result, isA<Right<dynamic, List<Character>>>());
    });
  });
}
