abstract class AddPostRepo {
  Future<void> uploadPost({String? text, String? image});
  Future<void> uploadPostInUserPosts({String? text, String? image});
}
