import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/database/cache/cache_helper.dart';
import '../../../core/di/dependency_injection.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController nickName = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey();

  Future register() async {
    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();
      emit(RegisterLoadingState());
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        getIt<CacheHelper>()
            .cacheData(key: "userId", value: credential.user!.uid);
        addUserToDataBase(uId: credential.user!.uid);
        emit(RegisterSuccessState());
      } on FirebaseAuthException catch (e) {
        _registerHandelException(e);
      }
    }
  }

  void _registerHandelException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(const RegisterFailureState(
          message: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(const RegisterFailureState(
          message: 'The account already exists for that email.'));
    } else {
      emit(const RegisterFailureState(
          message: 'Failed to register. Try again!'));
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
}
