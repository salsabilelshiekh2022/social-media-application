import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/database/cache/cache_helper.dart';
import '../../../core/di/dependency_injection.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey();

  Future signInWithGoogle() async {
    emit(SignInWithGoogleLoadingState());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(SignInWithGoogleCancleState());

        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      getIt<CacheHelper>()
          .cacheData(key: "userId", value: userCredential.user!.uid);
      final firestore = FirebaseFirestore.instance;
      final userSnapshot = await firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      if (userSnapshot.exists == false) {
        addUserToDataBase(uId: userCredential.user!.uid);
      }

      emit(SignInWithGoogleSuccessState());
    } catch (e) {
      emit(SignInWithGoogleFailureState(message: e.toString()));
    }
  }

  Future<void> addUserToDataBase({required String uId}) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(uId).set({
        "uId": uId,
      });

      emit(UserAddedToDatabaseSuccessState());
    } catch (e) {
      emit(UserAddedToDatabaseFailureState(message: e.toString()));
    }
  }

  Future signInWithFacebook() async {
    emit(SignInWithFaceBookLoadingState());
    try {
      final LoginResult loginResult = await FacebookAuth.instance
          .login(permissions: ['email', 'public_profile']);

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      getIt<CacheHelper>()
          .cacheData(key: "userId", value: userCredential.user!.uid);
      addUserToDataBase(uId: userCredential.user!.uid);
      emit(SignInWithFaceBookSuccessState());
    } catch (e) {
      emit(SignInWithFaceBookFailureState(message: e.toString()));
    }
  }

  Future signInWithEmailAndPassword() async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      emit(SignInWithEmailAndPasswordLoadingState());
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        getIt<CacheHelper>()
            .cacheData(key: "userId", value: credential.user!.uid);
        emit(SignInWithEmailAndPasswordSuccessState());
      } on FirebaseAuthException catch (e) {
        _signInWithEmailAndPasswordHandelException(e);
      }
    }
  }

  void _signInWithEmailAndPasswordHandelException(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      emit(const SignInWithEmailAndPasswordFailureState(
          message: 'No user found for that email.'));
    } else if (e.code == 'wrong-password') {
      emit(const SignInWithEmailAndPasswordFailureState(
          message: 'Wrong password provided for that user.'));
    } else {
      emit(const SignInWithEmailAndPasswordFailureState(
          message: 'The password or email is wrong'));
    }
  }
}
