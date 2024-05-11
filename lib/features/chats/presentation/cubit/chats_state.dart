part of 'chats_cubit.dart';

sealed class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => [];
}

final class ChatsInitial extends ChatsState {}

final class GetAllUsersLoadingState extends ChatsState {}

final class GetAllUsersSuccessState extends ChatsState {
  final List<UserModel> users;
  const GetAllUsersSuccessState({required this.users});
}

final class GetAllUsersErrorState extends ChatsState {
  final String message;
  const GetAllUsersErrorState({required this.message});
}

final class SendMessageSuccessState extends ChatsState {}

final class SendMessageErrorState extends ChatsState {
  final String message;
  const SendMessageErrorState({required this.message});
}

final class SendMessageLoadingState extends ChatsState {}

final class GetAllMessagesSuccessState extends ChatsState {}

final class GetAllMessagesErrorState extends ChatsState {
  final String message;
  const GetAllMessagesErrorState({required this.message});
}
