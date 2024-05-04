import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media_app/features/login/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey();

  Future<void> loginWithGoogle() async {
    emit(SignInWithGoogleLoadingState());
    var userAuth = await loginRepo.loginWithGoogle();
    userAuth.fold((failure) {
      emit(SignInWithGoogleFailureState(message: failure.message));
    }, (user) {
      emit(SignInWithGoogleSuccessState());
    });
  }

  Future<void> loginWithFaceBook() async {
    emit(SignInWithFaceBookLoadingState());
    var userAuth = await loginRepo.loginWithFacebook();
    userAuth.fold(
      (failure) =>
          emit(SignInWithFaceBookFailureState(message: failure.message)),
      (user) => emit(
        SignInWithFaceBookSuccessState(),
      ),
    );
  }

  Future<void> loginWithEmailAndPassword() async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      emit(SignInWithEmailAndPasswordLoadingState());
      var userAuth = await loginRepo.loginWithEmailAndPassword(
          email: email.text, password: password.text);

      userAuth.fold((failure) {
        emit(SignInWithEmailAndPasswordFailureState(message: failure.message));
      }, (user) {
        emit(SignInWithEmailAndPasswordSuccessState());
      });
    }
  }
}
