import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:chatbot_app/modules/chat/data/repos/gemini_chat_repo_imple.dart';
import 'package:chatbot_app/modules/chat/data/services/gemini_sevice.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late GeminiChatRepoImple geminiChatRepoImple;
  late GeminiMockService geminiMockService;

  setUp(() {
    geminiMockService = GeminiMockService();
    geminiChatRepoImple = GeminiChatRepoImple(geminiSevice: geminiMockService);
  });

  group('Send massage input validation', () {
    test('should throw exception when the massages list is empty', () { // ازاى test كل حاجه 
      expect(
        () => geminiChatRepoImple.sendMessage([]),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should throw exception if massages list contain emty massage', () {
      expect(
        () => geminiChatRepoImple.sendMessage([
          ChatMassageModel(role: 'user', text: ''),
        ]),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should throw exception if massage role is missing', () {
      expect(
        () => geminiChatRepoImple.sendMessage([
          ChatMassageModel(role: '', text: 'text'),
        ]),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('should throw exception if massage role is invalid', () {
      expect(
        () => geminiChatRepoImple.sendMessage([
          ChatMassageModel(role: 'invalid', text: 'text'),
        ]),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
  group('Send massage output validation', () {
    test('should throw exception when response text is empty', () {
      when(
        () => geminiMockService.sendChat(
          massages: any(named: 'massages'),
        ), 
      ).thenAnswer((_) async => ChatMassageModel(role: 'model', text: ''));
      expect(
        () => geminiChatRepoImple.sendMessage([
          ChatMassageModel(role: 'user', text: 'Hello'), 
        ]),
        throwsA(isA<ArgumentError>()),
      );
    });
    test('should throw exception when response role is missing', () {
      when(
        () => geminiMockService.sendChat(
          massages: any(named: 'massages'),
        ), // ✅ any
      ).thenAnswer(
        (_) async => ChatMassageModel(role: '', text: 'response text'),
      );
      expect(
        () => geminiChatRepoImple.sendMessage([
          ChatMassageModel(role: 'user', text: 'Hello'), 
        ]),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}

class GeminiMockService extends Mock implements GeminiSevice {}
