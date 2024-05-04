part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {}

final class RegisterFailureState extends RegisterState {
  final String message;
  const RegisterFailureState({required this.message});
}

final class UpdateProfileLoadingState extends RegisterState {}

final class UpdateProfileSuccessState extends RegisterState {}

final class UpdateProfileFailureState extends RegisterState {
  final String message;
  const UpdateProfileFailureState({required this.message});
}
