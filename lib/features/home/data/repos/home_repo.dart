import '../../../add_post/data/models/post_model.dart';

abstract class HomeRepo {
  Stream<List<PostModel>> getPosts();
}
