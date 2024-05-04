import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/core/errors/login_with_email_and_password_failure.dart';
import 'package:social_media_app/core/errors/login_with_google_failure.dart';
import '../../../../core/errors/login_with_facebook_failure.dart';

abstract class LoginRepo {
  Future<Either<LogInWithEmailAndPasswordFailure, User?>>
      loginWithEmailAndPassword(
          {required String email, required String password});

  Future<Either<LogInWithGoogleFailure, User?>> loginWithGoogle();

  Future<Either<LogInWithFacebookFailure, User?>> loginWithFacebook();
  Future<void> setUserData(User user);
}
