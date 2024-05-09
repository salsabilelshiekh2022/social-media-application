import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/database/network/auth.dart';
import '../../../../core/errors/signup_with_email_and_password_failure.dart';
import 'register_repo.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/database/network/firestore_services.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/utils/api_path.dart';
import '../../../login/data/models/user_model.dart';

class RegisterRepoImpl implements RegisterRepo {
  final AuthBase auth;
  final _fireStore = FirestoreServices.instance;

  RegisterRepoImpl({required this.auth});
  @override
  Future<Either<SignUpWithEmailAndPasswordFailure, User?>>
      registerWithEmailAndPassword(
          {required String email, required String password}) async {
    try {
      final userAuth = await auth.signUpWithEmailAndPassword(email, password);
      getIt<CacheHelper>().cacheData(key: "userId", value: userAuth!.uid);
      await setUserData(userAuth);
      return right(userAuth);
    } on FirebaseException catch (e) {
      return left(SignUpWithEmailAndPasswordFailure(e.toString()));
    }
  }

  @override
  Future<void> setUserData(User user) async {
    _fireStore.setData(
      path: ApiPath.user(user.uid),
      data: UserModel(
        email: user.email!,
        uId: user.uid,
      ).toMap(),
    );
  }

  @override
  Future<void> updateUserData({
    String? fullName,
    String? gender,
    String? phoneNumber,
    String? imgUrl,
    String? nickName,
    String? address,
  }) async {
    await _fireStore.updateData(
      path: ApiPath.user(getIt<CacheHelper>().getData(key: "userId")),
      data: {
        "fullName": fullName ?? '',
        "phone": phoneNumber ?? '',
        'gender': gender ?? '',
        'bio': '',
        'profilePhoto': imgUrl ?? '',
        'coverPhoto': '',
        'nickName': nickName ?? '',
        'address': address ?? '',
      },
    );

    await _fireStore.cacheUserData();
  }
}
