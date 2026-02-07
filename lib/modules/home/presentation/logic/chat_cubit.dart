import 'package:chatbot_app/modules/home/data/models/massage_model.dart';
import 'package:chatbot_app/modules/home/data/repo/chat_repo.dart';
import 'package:chatbot_app/modules/home/presentation/logic/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ChatCubit extends Cubit<ChatState> {
  final ChatRepo repo;

  ChatCubit(this.repo) : super(ChatInitial());

  Future<void> loadChat() async {
    final result = await repo.loadHistory();

    result.fold(
      (f) => emit(ChatFailuer(f.message)),
      (messages) => emit(ChatSuccess(messages)),
    );
  }

  Future<void> sendMessage(String text) async {
    final currentState = state as ChatSuccess;
    final currentMessages = currentState.messages;

    emit(ChatSuccess(
      [
        ...currentMessages,
        MassageModel(role: "user", text: text),
      ],
      isTyping: true,
    ));

    final result = await repo.sendMessage(text);

    result.fold(
      (failure) {
        emit(ChatSuccess(currentMessages, isTyping: false));
        emit(ChatFailuer(failure.message));
      },
      (messages) {
        emit(ChatSuccess(messages, isTyping: false));
      },
    );
  }
}

