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
      emit(GetPostsLoadingState());
      final posts = homeRepo.getPosts();
      emit(GetPostsSuccessState(posts: posts));
      return posts;
    } catch (e) {
      emit(GetPostsErrorState());
      rethrow;
    }
  }
}
