import 'package:chatbot_app/core/networking/api_client.dart';
import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:chatbot_app/modules/chat/data/services/gemini_sevice.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late GeminiSevice geminiSevice;
  late MockApiClient mockApiClient;

  final messages = [ChatMassageModel(role: 'user', text: 'Hello')];

  final successResponse = Response(
    requestOptions: RequestOptions(),
    data: {
      'candidates': [
        {
          'content': {
            'parts': [
              {'text': 'Hi there!'},
            ],
          },
        },
      ],
    },
  );

  final dioException = DioException(
    requestOptions: RequestOptions(),
    response: Response(
      requestOptions: RequestOptions(),
      data: {
        'error': {'message': 'exceeded retry limits'},
      },
    ),
  );

  setUp(() {
    mockApiClient = MockApiClient();
    geminiSevice = GeminiSevice(apiClient: mockApiClient);
  });

  group('sendChat retry logic', () {
    test('should return response on first successful time', () async {
      when(
        () => mockApiClient.post(
          url: any(named: 'url'),
          data: any(named: 'data'),
          apiKey: any(named: 'apiKey'),
        ),
      ).thenAnswer((_) async => successResponse);

      final result = await geminiSevice.sendChat(massages: messages);

      expect(result.text, 'Hi there!');
      expect(result.role, 'model');
      verify(
        () => mockApiClient.post(
          url: any(named: 'url'),
          data: any(named: 'data'),
          apiKey: any(named: 'apiKey'),
        ),
      ).called(1);
    });

    test('should retry and succeed on 3rd time', () async {
      var callCount = 0;
      when(
        () => mockApiClient.post(
          url: any(named: 'url'),
          data: any(named: 'data'),
          apiKey: any(named: 'apiKey'),
        ),
      ).thenAnswer((_) async {
        callCount++;
        if (callCount < 3) throw dioException;
        return successResponse;
      });

      final result = await geminiSevice.sendChat(massages: messages);

      expect(result.text, 'Hi there!');
      verify(
        () => mockApiClient.post(
          url: any(named: 'url'),
          data: any(named: 'data'),
          apiKey: any(named: 'apiKey'),
        ),
      ).called(3);
    });

    test('should throw exception after 3 failed times', () async {
      when(
        () => mockApiClient.post(
          url: any(named: 'url'),
          data: any(named: 'data'),
          apiKey: any(named: 'apiKey'),
        ),
      ).thenThrow(dioException);

      expect(
        () => geminiSevice.sendChat(massages: messages),
        throwsA(isA<ArgumentError>()),
      );

      await Future.delayed(const Duration(seconds: 3));// expect later

      verify(
        () => mockApiClient.post(
          url: any(named: 'url'),
          data: any(named: 'data'),
          apiKey: any(named: 'apiKey'),
        ),
      ).called(3);
    });
  });
}
