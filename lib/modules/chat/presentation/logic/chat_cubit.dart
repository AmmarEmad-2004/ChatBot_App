import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:chatbot_app/modules/chat/data/repos/chat_repo.dart';
import 'package:chatbot_app/modules/chat/presentation/logic/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo repo;
  final List<ChatMassageModel> _messages = []; 

  ChatCubit(this.repo) : super(ChatInitial());

  Future<void> sendMessage(List<ChatMassageModel> newMessages) async {
    _messages.addAll(newMessages);
 

    emit(ChatSuccess(List.from(_messages), isTyping: true));

    try {
      final aiResponse = await repo.sendMessage(_messages);

    
      _messages.add(aiResponse);

      emit(ChatSuccess(List.from(_messages), isTyping: false));
    } on Exception catch (e) {
      emit(ChatFailuer(e.toString()));
    }
  }


}
