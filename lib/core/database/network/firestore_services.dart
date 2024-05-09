import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:social_media_app/core/di/dependency_injection.dart';

import '../../../features/login/data/models/user_model.dart';
import '../cache/cache_helper.dart';

class FirestoreServices {
  FirestoreServices._();

  static final instance = FirestoreServices._();

  final _fireStore = FirebaseFirestore.instance;

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _fireStore.doc(path);
    debugPrint('Request Data: $data');
    await reference.set(data);
  }

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _fireStore.doc(path);
    debugPrint('Request Data: $data');
    await reference.update(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = _fireStore.doc(path);
    debugPrint('Path: $path');
    await reference.delete();
  }

  Stream<T> documentsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
  }) {
    final reference = _fireStore.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  Stream<List<T>> collectionsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = _fireStore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map(
            (snapshot) => builder(
              snapshot.data() as Map<String, dynamic>,
              snapshot.id,
            ),
          )
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Future<T> getDocument<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentID) builder,
  }) async {
    final reference = _fireStore.doc(path);
    final snapshot = await reference.get();
    return builder(snapshot.data() as Map<String, dynamic>, snapshot.id);
  }

  Future<List<T>> getCollection<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) async {
    Query query = _fireStore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = await query.get();
    final result = snapshots.docs
        .map((snapshot) =>
            builder(snapshot.data() as Map<String, dynamic>, snapshot.id))
        .where((value) => value != null)
        .toList();
    if (sort != null) {
      result.sort(sort);
    }
    return result;
  }

  Future<UserModel> cacheUserData() async {
    final snapshot = await _fireStore
        .collection('users')
        .doc(getIt<CacheHelper>().getData(key: 'userId'))
        .get();
    final userData = UserModel.fromMap(snapshot.data()!);
    getIt<CacheHelper>()
        .cacheData(key: "profilePhoto", value: userData.profilePhoto);
    getIt<CacheHelper>()
        .cacheData(key: "coverPhoto", value: userData.coverPhoto);
    getIt<CacheHelper>().cacheData(key: "fullName", value: userData.fullName);
    getIt<CacheHelper>().cacheData(key: "fullName", value: userData.fullName);
    getIt<CacheHelper>().cacheData(key: "nickName", value: userData.nickName);
    getIt<CacheHelper>().cacheData(key: "email", value: userData.email);
    getIt<CacheHelper>().cacheData(key: "bio", value: userData.bio);
    getIt<CacheHelper>().cacheData(key: "phone", value: userData.phone);
    getIt<CacheHelper>().cacheData(key: "address", value: userData.address);
    return userData;
  }
}
