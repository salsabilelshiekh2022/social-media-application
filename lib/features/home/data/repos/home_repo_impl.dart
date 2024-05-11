import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/database/network/firestore_services.dart';
import '../../../../core/utils/api_path.dart';
import '../../../../core/utils/constants.dart';
import '../../../add_post/data/models/post_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final _fireStore = FirestoreServices.instance;
  @override
  Stream<List<PostModel>> getPosts() {
    final posts = _fireStore.collectionsStream(
      path: ApiPath.posts,
      builder: (data, documentId) => PostModel.fromMap(data!),
    );
    return posts;
  }

  @override
  Future<void> likePost(String postId) async {
    await _fireStore.updateData(path: '${ApiPath.posts}/$postId', data: {
      'likes': FieldValue.arrayUnion([AppConstants.userId])
    });
  }

  @override
  Future<void> dislikePost(String postId) async {
    await _fireStore.updateData(path: '${ApiPath.posts}/$postId', data: {
      'likes': FieldValue.arrayRemove([AppConstants.userId])
    });
  }
}
