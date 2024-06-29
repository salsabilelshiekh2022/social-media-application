import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media_app/core/theme/app_colors.dart';
import 'package:social_media_app/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/app_assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      getIt<CacheHelper>().getData(key: 'userId') == null
          ? context.pushReplacementNamed(Routes.onBoardingView)
          : context.pushReplacementNamed(
              Routes.loginView,
            );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppAssets.logo,
          height: 128.h,
          width: 160.w,
          colorFilter:
              const ColorFilter.mode(AppColors.mainColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
