import 'package:chatbot_app/core/errors/failuers.dart';
import 'package:chatbot_app/core/services/gemini_sevice.dart';
import 'package:chatbot_app/modules/home/data/datasource/chat_local_ds.dart';
import 'package:chatbot_app/modules/home/data/models/massage_model.dart';
import 'package:chatbot_app/modules/home/data/repo/chat_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ChatRepoImpl implements ChatRepo {
  final GeminiSevice remote;
  final ChatLocalDs local;

  final List<MassageModel> cache = [];

  ChatRepoImpl(this.remote, this.local);

  @override
  Future<Either<Failure, List<MassageModel>>> loadHistory() async {
    try {
      final history = await local.getHistory();
      cache
        ..clear()
        ..addAll(history);
      return Right(cache);
    } catch (_) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<MassageModel>>> sendMessage(String text) async {
    try {
      final userMsg = MassageModel(role: "user", text: text);
      cache.add(userMsg);
      await local.saveMessage(userMsg);

      final aiText = await remote.sendChat(cache);

      final aiMsg = MassageModel(role: "model", text: aiText);
      cache.add(aiMsg);
      await local.saveMessage(aiMsg);

      return Right(List.from(cache));
    } on DioException {
      return Left(NetworkFailure());
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
