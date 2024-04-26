import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/routing/app_router.dart';
import 'package:social_media_app/social_app.dart';

import 'core/database/cache/cache_helper.dart';
import 'core/di/dependency_injection.dart';
import 'firebase_options.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  await getIt<CacheHelper>().appInitialization();
  await ScreenUtil.ensureScreenSize();
  runApp(SocialApp(
    appRouter: AppRouter(),
  ));
}
