part of 'add_post_cubit.dart';

sealed class AddPostState extends Equatable {
  const AddPostState();

  @override
  List<Object> get props => [];
}

final class AddPostInitial extends AddPostState {}

final class PickImageLoadingState extends AddPostState {}

final class PickImageSuccessState extends AddPostState {}

final class PickImageFailureState extends AddPostState {
  final String message;

  const PickImageFailureState({required this.message});
}

final class RemoveImageState extends AddPostState {}
