import 'package:flutter/material.dart';
import 'package:social_media_app/features/forgot_password/presentation/views/forgot_password_method_view.dart';
import 'package:social_media_app/features/forgot_password/presentation/views/forgot_password_otp_view.dart';
import 'package:social_media_app/features/login/views/welcome_view.dart';
import 'package:social_media_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:social_media_app/features/register/views/fill_your_profile_view.dart';
import 'package:social_media_app/features/register/views/register_view.dart';
import 'package:social_media_app/features/register/views/select_gender_view.dart';

import '../../features/forgot_password/presentation/views/create_new_password_view.dart';
import '../../features/login/views/login_page.dart';
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
      case Routes.selectGenderView:
        return MaterialPageRoute(
          builder: (_) => const SelectGenderView(),
        );

      case Routes.fillYourProfileView:
        return MaterialPageRoute(
          builder: (_) => const FillYourProfileView(),
        );
      case Routes.forgotPasswordMethodView:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordMethodView(),
        );
      case Routes.forgotPasswordOtpView:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordOtpView(),
        );
      case Routes.createNewPasswordView:
        return MaterialPageRoute(
          builder: (_) => const CreateNewPasswordView(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}
