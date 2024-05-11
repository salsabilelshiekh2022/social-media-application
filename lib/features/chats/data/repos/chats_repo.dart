import 'package:social_media_app/features/login/data/models/user_model.dart';

abstract class ChatsRepo {
  Future<List<UserModel>> getAllUsers();
}
