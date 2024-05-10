import 'package:social_media_app/features/add_post/data/models/post_model.dart';

import '../../../../core/database/network/firestore_services.dart';
import '../../../../core/utils/api_path.dart';
import '../../../../core/utils/constants.dart';
import 'add_post_repo.dart';

final _fireStore = FirestoreServices.instance;

class AddPostRepoImpl implements AddPostRepo {
  @override
  Future<void> uploadPost({String? text, String? image}) async {
    await _fireStore.addData(
      path: ApiPath.posts,
      data: PostModel(
              fullName: AppConstants.fullName,
              nickName: AppConstants.nickName,
              profilePhoto: AppConstants.userImage,
              postImage: image,
              dateTime: DateTime.now().toString(),
              postText: text)
          .toMap(),
    );
    await uploadPostInUserPosts(
      text: text,
      image: image,
    );
  }

  @override
  Future<void> uploadPostInUserPosts({String? text, String? image}) async {
    await _fireStore.addData(
      path: ApiPath.userPost(AppConstants.userId),
      data: PostModel(
              fullName: AppConstants.fullName,
              nickName: AppConstants.nickName,
              profilePhoto: AppConstants.userImage,
              postImage: image,
              dateTime: DateTime.now().toString(),
              postText: text)
          .toMap(),
    );
  }
}
