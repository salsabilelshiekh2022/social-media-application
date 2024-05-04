import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/signup_with_email_and_password_failure.dart';

abstract class RegisterRepo {
  Future<Either<SignUpWithEmailAndPasswordFailure, User?>>
      registerWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> setUserData(User user);

  Future<void> updateUserData({
    String? fullName,
    String? gender,
    String? phoneNumber,
    String? imgUrl,
    String? nickName,
    String? address,
  });
}
