import 'package:flutter/material.dart';
import 'package:social_media_app/features/login/presentation/views/welcome_view.dart';
import 'package:social_media_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:social_media_app/features/register/presentation/views/register_view.dart';

import '../../features/login/presentation/views/login_page.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );

      case Routes.splashView:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      case Routes.onBoardingView:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case Routes.welcomeView:
        return MaterialPageRoute(
          builder: (_) => const WelcomeView(),
        );
      case Routes.registerView:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}
