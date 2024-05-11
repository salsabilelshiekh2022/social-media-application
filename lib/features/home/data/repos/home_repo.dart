import '../../../add_post/data/models/post_model.dart';

abstract class HomeRepo {
  Stream<List<PostModel>> getPosts();

  Future<void> likePost(String postId);

  Future<void> dislikePost(String postId);
}
