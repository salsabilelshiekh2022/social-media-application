import '../database/cache/cache_helper.dart';
import '../di/dependency_injection.dart';

abstract class AppConstants {
  static String userImage = getIt<CacheHelper>().getData(key: 'profilePhoto');
  static String fullName = getIt<CacheHelper>().getData(key: 'fullName');
  static String nickName = getIt<CacheHelper>().getData(key: 'nickName');
  static String email = getIt<CacheHelper>().getData(key: 'email');
  static String phone = getIt<CacheHelper>().getData(key: 'phone');
  static String address = getIt<CacheHelper>().getData(key: 'address');
  static String bio = getIt<CacheHelper>().getData(key: 'bio');
  static String coverPhoto = getIt<CacheHelper>().getData(key: 'coverPhoto');
}
