import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../common/models/base_response.dart';
import '../../features/character/data/models/character_model.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/character")
  Future<BaseResponse<List<CharacterModel>>> getCharacters();
}
