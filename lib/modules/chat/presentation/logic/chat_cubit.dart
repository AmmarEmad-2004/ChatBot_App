import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:chatbot_app/modules/chat/data/repos/chat_repo.dart';
import 'package:chatbot_app/modules/chat/presentation/logic/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo repo;

  ChatCubit(this.repo) : super(ChatInitial());

  Future<void> sendMessage({
    required List<ChatMassageModel> newMessages,
  }) async {
    emit(ChatLoading());

    try {
      final aiResponse = await repo.sendMessage(newMessages);

      emit(ChatSuccess(massage: aiResponse));
    } on Exception catch (e) {
      emit(ChatFailuer(e.toString()));
    }
  }
}
