import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/repos/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;
  String? email, password, fullName, phoneNumber, nickName, address;
  GlobalKey<FormState> registerFormKey = GlobalKey();
  String gender = 'Male';

  final storage = FirebaseStorage.instance;
  String imgUrl = '';

  File? userImg;
  getImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      userImg = File(pickedImage.path);
    } else {}
  }

  Future<void> uploadImage() async {
    if (userImg != null) {
      final ref = await storage
          .ref()
          .child("users/${Uri(path: userImg!.path).pathSegments.last}")
          .putFile(userImg!);
      imgUrl = await ref.ref.getDownloadURL();
    }
  }

  Future register() async {
    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();
      emit(RegisterLoadingState());
      var userAuth = await registerRepo.registerWithEmailAndPassword(
          email: email!, password: password!);
      userAuth.fold((failure) {
        emit(RegisterFailureState(message: failure.message));
      }, (user) {
        emit(RegisterSuccessState());
      });
    }
  }

  Future<void> updateProfile() async {
    emit(UpdateProfileLoadingState());
    try {
      await uploadImage();
      await registerRepo.updateUserData(
        fullName: fullName,
        gender: gender,
        phoneNumber: phoneNumber,
        imgUrl: imgUrl,
        nickName: nickName,
        address: address,
      );
      emit(UpdateProfileSuccessState());
    } catch (e) {
      emit(UpdateProfileFailureState(message: e.toString()));
    }
  }
}
