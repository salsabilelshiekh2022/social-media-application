import 'package:social_media_app/features/login/data/models/user_model.dart';

import '../models/message_model.dart';

abstract class ChatsRepo {
  Future<List<UserModel>> getAllUsers();

  Future<void> sendMessage({
    required String receiverId,
    required String text,
    String? file,
  });

  Stream<List<MessageModel>> getMessages({
    required String receiverId,
  });
}
