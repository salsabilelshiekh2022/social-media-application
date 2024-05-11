import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/core/utils/constants.dart';
import 'package:social_media_app/features/chats/data/models/message_model.dart';
import 'package:social_media_app/features/login/data/models/user_model.dart';

import '../../../../core/database/network/firestore_services.dart';
import 'chats_repo.dart';

class ChatsRepoImpl implements ChatsRepo {
  final _fireStore = FirestoreServices.instance;
  @override
  Future<List<UserModel>> getAllUsers() async {
    final users = await _fireStore.getCollection(
      path: 'users',
      builder: (data, documentId) => UserModel.fromMap(data),
    );

    return users;
  }

  @override
  Future<void> sendMessage(
      {required String receiverId, required String text, String? file}) async {
    await _fireStore.addData(
        path: 'users/${AppConstants.userId}/chats/$receiverId/messages',
        data: MessageModel(
          senderId: AppConstants.userId,
          receiverId: receiverId,
          text: text,
          file: file,
          dateTime: Timestamp.now().toDate().toString(),
        ).toMap());

    await _fireStore.addData(
        path: 'users/$receiverId/chats/${AppConstants.userId}/messages',
        data: MessageModel(
          senderId: AppConstants.userId,
          receiverId: receiverId,
          text: text,
          file: file,
          dateTime: Timestamp.now().toDate().toString(),
        ).toMap());
  }

  @override
  Stream<List<MessageModel>> getMessages({required String receiverId}) {
    final messages = _fireStore.collectionsStream(
      path: 'users/${AppConstants.userId}/chats/$receiverId/messages',
      builder: (data, documentId) => MessageModel.fromMap(data!),
      sort: (lhs, rhs) => rhs.dateTime!.compareTo(lhs.dateTime!),
    );
    return messages;
  }
}
