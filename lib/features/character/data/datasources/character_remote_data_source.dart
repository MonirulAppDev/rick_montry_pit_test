import '../../../../core/network/api_client.dart';
import '../models/character_model.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getAllCharacters();
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final ApiClient apiClient;

  CharacterRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    final response = await apiClient.getCharacters();
    return response.data ?? [];
  }
}
