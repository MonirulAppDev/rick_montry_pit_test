import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:rick_montry_pit_test/core/network/api_client.dart';
import 'package:rick_montry_pit_test/core/network/custom_interceptor.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late ApiClient apiClient;

  const baseUrl = "https://rickandmortyapi.com/api";

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dioAdapter = DioAdapter(dio: dio);

    // Using simple instance for test as per your instruction to not modify interceptor
    dio.interceptors.add(CustomInterceptors());

    apiClient = ApiClient(dio);
  });

  group('getCharacters', () {
    test(
      'should return BaseResponse with List of CharacterModel when successful',
      () async {
        // arrange
        const path = '/character';
        final mockResponse = {
          "results": [
            {
              "id": 1,
              "name": "Rick Sanchez",
              "status": "Alive",
              "species": "Human",
              "type": "",
              "gender": "Male",
              "origin": {"name": "Earth", "url": ""},
              "location": {"name": "Earth", "url": ""},
              "image": "",
              "episode": [],
              "url": "",
              "created": "",
            },
          ],
        };

        dioAdapter.onGet(path, (server) => server.reply(200, mockResponse));

        // act
        final result = await apiClient.getCharacters(null, null, null, null);

        // assert
        expect(result.data, isNotNull);
        expect(result.data!.length, 1);
        expect(result.data![0].name, 'Rick Sanchez');
        expect(result.statusCode, 200);
      },
    );

    test('should handle empty results correctly', () async {
      // arrange
      const path = '/character';
      final mockResponse = {"results": []};

      dioAdapter.onGet(path, (server) => server.reply(200, mockResponse));

      // act
      final result = await apiClient.getCharacters(null, null, null, null);

      // assert
      expect(result.data, isEmpty);
      expect(result.statusCode, 200);
    });
  });
}
