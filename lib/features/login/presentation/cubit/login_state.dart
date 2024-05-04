part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class SignInWithGoogleLoadingState extends LoginState {}

final class SignInWithGoogleSuccessState extends LoginState {}

final class SignInWithGoogleFailureState extends LoginState {
  final String message;

  const SignInWithGoogleFailureState({required this.message});
}

final class SignInWithFaceBookLoadingState extends LoginState {}

final class SignInWithFaceBookSuccessState extends LoginState {}

final class SignInWithFaceBookFailureState extends LoginState {
  final String message;

  const SignInWithFaceBookFailureState({required this.message});
}

final class SignInWithEmailAndPasswordLoadingState extends LoginState {}

final class SignInWithEmailAndPasswordSuccessState extends LoginState {}

final class SignInWithEmailAndPasswordFailureState extends LoginState {
  final String message;

  const SignInWithEmailAndPasswordFailureState({required this.message});
}
