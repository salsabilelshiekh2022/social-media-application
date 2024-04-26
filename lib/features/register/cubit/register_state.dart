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

final class UserAddedToDatabaseSuccessState extends RegisterState {}

final class UserAddedToDatabaseFailureState extends RegisterState {
  final String message;
  const UserAddedToDatabaseFailureState({required this.message});
}
