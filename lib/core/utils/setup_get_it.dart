import 'package:chatbot_app/core/networking/api_client.dart';
import 'package:chatbot_app/modules/chat/data/repos/chat_repo.dart';
import 'package:chatbot_app/modules/chat/data/repos/gemini_chat_repo_imple.dart';
import 'package:chatbot_app/modules/chat/data/services/gemini_sevice.dart';
import 'package:chatbot_app/modules/chat/presentation/logic/chat_cubit.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  getIt.registerLazySingleton<GeminiSevice>(
    () => GeminiSevice(apiClient: getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<ChatRepo>(
    () => GeminiChatRepoImple(geminiSevice: getIt<GeminiSevice>()),
  );
  getIt.registerFactory<ChatCubit>(
    () => ChatCubit(repo: getIt<ChatRepo>()),
  );
}
