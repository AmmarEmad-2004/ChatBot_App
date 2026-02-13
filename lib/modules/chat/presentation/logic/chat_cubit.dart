import 'package:chatbot_app/modules/chat/data/models/chat_massage_model.dart';
import 'package:chatbot_app/modules/chat/data/repos/chat_repo.dart';
import 'package:chatbot_app/modules/chat/presentation/logic/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo repo;
final List<ChatMassageModel> massages=[];
  ChatCubit(this.repo) : super(ChatInitial());

  Future<void> sendMessage(List<ChatMassageModel> massages) async {
    emit(ChatLoading());
    try {
      final chatMassage = await repo.sendMessage(massages);
      massages.add(chatMassage);
      emit(ChatSuccess(massages));
    } on Exception catch (e) {
      emit(ChatFailuer(e.toString()));
    }
  }
}

