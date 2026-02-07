import 'package:chatbot_app/core/errors/failuers.dart';
import 'package:chatbot_app/modules/home/data/models/massage_model.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepo {
  Future<Either<Failure, List<MassageModel>>> loadHistory();
  Future<Either<Failure, List<MassageModel>>> sendMessage(String text);
}