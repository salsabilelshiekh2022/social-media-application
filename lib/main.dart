import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/routing/app_router.dart';
import 'package:social_media_app/social_app.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  await ScreenUtil.ensureScreenSize();
  runApp(SocialApp(
    appRouter: AppRouter(),
  ));
}
