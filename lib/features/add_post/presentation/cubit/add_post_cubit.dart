import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/features/add_post/data/repos/add_post_repo.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit({required this.addPostRepo}) : super(AddPostInitial());
  final AddPostRepo addPostRepo;

  final storage = FirebaseStorage.instance;

  String imgUrl = '';

  File? postImg;
  String? postText;
  getImageFromGallery() async {
    emit(PickImageLoadingState());
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      postImg = File(pickedImage.path);
      emit(PickImageSuccessState());
    } else {
      emit(const PickImageFailureState(message: 'Failed to pick image '));
    }
  }

  getImageFromCamera() async {
    emit(PickImageLoadingState());
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      postImg = File(pickedImage.path);
      emit(PickImageSuccessState());
    } else {
      emit(const PickImageFailureState(message: 'Failed to pick image '));
    }
  }

  removeImage() {
    postImg = null;
    emit(RemoveImageState());
  }

  Future<void> uploadImage() async {
    if (postImg != null) {
      final ref = await storage
          .ref()
          .child("postsImages/${Uri(path: postImg!.path).pathSegments.last}")
          .putFile(postImg!);
      imgUrl = await ref.ref.getDownloadURL();
    }
  }

  Future<void> uploadPost({String? text, String? image}) async {
    emit(UploadPostLoadingState());
    try {
      await uploadImage();
      await addPostRepo.uploadPost(text: postText, image: imgUrl);
      emit(UploadPostSuccessState());
    } catch (e) {
      emit(UploadPostFailureState(message: e.toString()));
    }
  }
}
