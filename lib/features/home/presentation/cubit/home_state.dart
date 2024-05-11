part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class GetPostsLoadingState extends HomeState {}

final class GetPostsSuccessState extends HomeState {
  final Stream<List<PostModel>> posts;

  const GetPostsSuccessState({required this.posts});
}

final class GetPostsErrorState extends HomeState {}

final class LikePostErrorState extends HomeState {}

final class SavePostErrorState extends HomeState {}

final class DislikePostErrorState extends HomeState {}

final class UnSavePostErrorState extends HomeState {}
