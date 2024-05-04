import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/database/network/auth.dart';
import '../../../../core/database/network/firestore_services.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/errors/login_with_email_and_password_failure.dart';
import '../../../../core/errors/login_with_facebook_failure.dart';
import '../../../../core/errors/login_with_google_failure.dart';
import '../../../../core/utils/api_path.dart';
import '../models/user_model.dart';
import 'login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final AuthBase auth;
  final _fireStore = FirestoreServices.instance;
  LoginRepoImpl({required this.auth});

  @override
  Future<Either<LogInWithEmailAndPasswordFailure, User?>>
      loginWithEmailAndPassword(
          {required String email, required String password}) async {
    try {
      final userAuth = await auth.loginWithEmailAndPassword(email, password);
      getIt<CacheHelper>().cacheData(key: "userId", value: userAuth!.uid);
      return right(userAuth);
    } on FirebaseException catch (e) {
      return left(LogInWithEmailAndPasswordFailure(e.toString()));
    }
  }

  @override
  Future<Either<LogInWithFacebookFailure, User?>> loginWithFacebook() async {
    try {
      final userAuth = await auth.signInWithFacebook();
      getIt<CacheHelper>().cacheData(key: "userId", value: userAuth!.uid);
      await setUserData(userAuth);
      return right(userAuth);
    } on FirebaseException catch (e) {
      return left(LogInWithFacebookFailure(e.toString()));
    }
  }

  @override
  Future<Either<LogInWithGoogleFailure, User?>> loginWithGoogle() async {
    try {
      final userAuth = await auth.signInWithGoogle();
      getIt<CacheHelper>().cacheData(key: "userId", value: userAuth!.uid);
      await setUserData(userAuth);
      return right(userAuth);
    } on FirebaseException catch (e) {
      return left(LogInWithGoogleFailure(e.toString()));
    }
  }

  @override
  Future<void> setUserData(User user) async {
    _fireStore.setData(
      path: ApiPath.user(user.uid),
      data: UserModel(
        email: user.email!,
        uId: user.uid,
        fullName: user.displayName,
        nickName: user.displayName,
        profilePhoto: user.photoURL,
        bio: '',
        gender: '',
        coverPhoto: '',
        phone: user.phoneNumber ?? '',
        address: '',
      ).toMap(),
    );
  }
}
