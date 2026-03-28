import '../../../../core/network/api_client.dart';
import '../models/character_model.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getAllCharacters(int page);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final ApiClient apiClient;

  CharacterRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<CharacterModel>> getAllCharacters(int page) async {
    final response = await apiClient.getCharacters(page);
    return response.data ?? [];
  }
}
