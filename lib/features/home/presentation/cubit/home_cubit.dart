import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_media_app/features/add_post/data/models/post_model.dart';
import 'package:social_media_app/features/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());
  final HomeRepo homeRepo;

  Stream<List<PostModel>> getPosts() {
    try {
      final posts = homeRepo.getPosts();
      emit(GetPostsSuccessState(posts: posts));
      return posts;
    } catch (e) {
      emit(GetPostsErrorState());
      return const Stream.empty();
    }
  }

  Future<void> likePost({required String postId}) async {
    try {
      await homeRepo.likePost(postId);
    } catch (e) {
      emit(LikePostErrorState());
    }
  }

  Future<void> savePost({required String postId}) async {
    try {
      await homeRepo.savePost(postId);
    } catch (e) {
      emit(SavePostErrorState());
    }
  }

  Future<void> repostPost({required String postId}) async {
    try {
      await homeRepo.repostPost(postId);
    } catch (e) {
      emit(RepostPostErrorState());
    }
  }

  Future<void> dislikePost({required String postId}) async {
    try {
      await homeRepo.dislikePost(postId);
    } catch (e) {
      emit(DislikePostErrorState());
    }
  }

  Future<void> unSavePost({required String postId}) async {
    try {
      await homeRepo.unSavePost(postId);
    } catch (e) {
      emit(UnSavePostErrorState());
    }
  }

  Future<void> unRepostPost({required String postId}) async {
    try {
      await homeRepo.unRepostPost(postId);
    } catch (e) {
      emit(UnRepostPostErrorState());
    }
  }
}
