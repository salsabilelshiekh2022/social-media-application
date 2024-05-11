import '../../../add_post/data/models/post_model.dart';

abstract class HomeRepo {
  Stream<List<PostModel>> getPosts();

  Future<void> likePost(String postId);

  Future<void> dislikePost(String postId);

  Future<void> savePost(String postId);

  Future<void> unSavePost(String postId);

  Future<void> repostPost(String postId);

  Future<void> unRepostPost(String postId);
}
