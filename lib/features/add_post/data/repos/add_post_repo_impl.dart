import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/features/add_post/data/models/post_model.dart';

import '../../../../core/database/network/firestore_services.dart';
import '../../../../core/utils/api_path.dart';
import '../../../../core/utils/constants.dart';
import 'add_post_repo.dart';

final _fireStore = FirestoreServices.instance;

class AddPostRepoImpl implements AddPostRepo {
  @override
  Future<void> uploadPost({String? text, String? image}) async {
    CollectionReference postsCollection =
        FirebaseFirestore.instance.collection(ApiPath.posts);
    DocumentReference postRef = await postsCollection.add(
      PostModel(
              fullName: AppConstants.fullName,
              nickName: AppConstants.nickName,
              profilePhoto: AppConstants.userImage,
              userId: AppConstants.userId,
              postImage: image,
              dateTime: Timestamp.now().toDate().toString(),
              comments: [],
              likes: [],
              shares: [],
              bookMarks: [],
              postText: text)
          .toMap(),
    );

    await _fireStore.updateData(
        path: '${ApiPath.posts}/${postRef.id}', data: {'id': postRef.id});
  }
}
