import 'package:flutter/material.dart';

import '../../features/login/presentation/views/login_page.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );

      case Routes.splashPage:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}
