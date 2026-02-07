import 'package:chatbot_app/core/routing/app_routers.dart';
import 'package:chatbot_app/modules/home/presentation/screens/chat_screen.dart';
import 'package:chatbot_app/modules/onboarding/screens/onboarding_screen.dart';
import 'package:chatbot_app/modules/splash/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final goRouter = GoRouter(
    routes: [
      GoRoute(
        path: AppRouters.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRouters.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRouters.chatScreen,
        builder: (context, state) => const ChatScreen(),
      ),
     
    ],
  );
}