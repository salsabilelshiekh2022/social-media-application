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
}
