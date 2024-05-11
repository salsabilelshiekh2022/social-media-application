import 'package:flutter/material.dart';
import 'package:social_media_app/features/login/data/models/user_model.dart';

import '../../features/add_post/presentation/views/add_post_view.dart';
import '../../features/chats/presentation/views/chat_view.dart';
import '../../features/forgot_password/presentation/views/create_new_password_view.dart';
import '../../features/forgot_password/presentation/views/forgot_password_method_view.dart';
import '../../features/forgot_password/presentation/views/forgot_password_otp_view.dart';
import '../../features/home/presentation/views/nav_bar.dart';
import '../../features/login/presentation/views/login_page.dart';
import '../../features/login/presentation/views/welcome_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/register/presentation/views/fill_your_profile_view.dart';
import '../../features/register/presentation/views/register_view.dart';
import '../../features/register/presentation/views/select_gender_view.dart';
import '../../features/search/presentation/views/for_search_view.dart';
import '../../features/search/presentation/views/search_view.dart';
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
      case Routes.searchView:
        return MaterialPageRoute(
          builder: (_) => const SearchView(),
        );
      case Routes.navBar:
        return MaterialPageRoute(
          builder: (_) => const NavBarView(),
        );
      case Routes.addPostView:
        return MaterialPageRoute(
          builder: (_) => const AddPostView(),
        );
      case Routes.forSearchView:
        return MaterialPageRoute(
          builder: (_) => const ForSearchView(),
        );
      case Routes.chatView:
        final args = settings.arguments as Map<String, dynamic>;
        final user = args['user'] as UserModel;
        return MaterialPageRoute(
          builder: (_) => ChatView(
            user: user,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}
