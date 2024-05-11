import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_media_app/core/utils/constants.dart';

import '../../../login/data/models/user_model.dart';
import '../../data/repos/chats_repo.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit({required this.chatRepo}) : super(ChatsInitial());
  final ChatsRepo chatRepo;

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
}
