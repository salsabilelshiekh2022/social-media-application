import '../../../../core/database/network/firestore_services.dart';
import '../../../../core/utils/api_path.dart';
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
}
