import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/core/utils/constants.dart';
import 'package:social_media_app/features/chats/data/models/message_model.dart';

import '../../../login/data/models/user_model.dart';
import '../../data/repos/chats_repo.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit({required this.chatRepo}) : super(ChatsInitial());
  final ChatsRepo chatRepo;

  String? file;
  TextEditingController textMessage = TextEditingController();
  final ScrollController scrollController = ScrollController();

  Future<List<UserModel>> getAllUsers() async {
    emit(GetAllUsersLoadingState());
    try {
      final user = await chatRepo.getAllUsers();
      emit(GetAllUsersSuccessState(
          users: user
              .where((element) =>
                  element.uId.contains(AppConstants.userId) == false)
              .toList()));
      return user;
    } catch (e) {
      emit(GetAllUsersErrorState(
        message: e.toString(),
      ));
      return [];
    }
  }

  Future<void> sendMessage({
    required String receiverId,
  }) async {
    emit(SendMessageLoadingState());
    try {
      await chatRepo.sendMessage(
        receiverId: receiverId,
        text: textMessage.text,
        file: file,
      );
      emit(SendMessageSuccessState());
    } catch (e) {
      emit(SendMessageErrorState(
        message: e.toString(),
      ));
    }
  }

  Stream<List<MessageModel>> getMessages({required String receiverId}) {
    try {
      final messages = chatRepo.getMessages(receiverId: receiverId);

      emit(GetAllMessagesSuccessState());

      return messages;
    } catch (e) {
      emit(GetAllMessagesErrorState(
        message: e.toString(),
      ));

      return const Stream.empty();
    }
  }

  void scrollDown() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
