import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/routing/app_router.dart';
import 'package:social_media_app/core/theme/app_colors.dart';

import 'core/utils/app_constants.dart';

class SocialApp extends StatelessWidget {
  final AppRouter appRouter;
  const SocialApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: scaffoldKey,
          theme: ThemeData(
            fontFamily: "Urbanist",
            brightness: Brightness.dark,
            primaryColor: AppColors.mainColor,
            appBarTheme: const AppBarTheme(
              elevation: 0.0,
            ),
            scaffoldBackgroundColor: AppColors.dark1,
          ),
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
