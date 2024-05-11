import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? id;
  String? userId;
  String? fullName;
  String? nickName;
  String? profilePhoto;
  String? postText;
  String? postImage;
  String? dateTime = Timestamp.now().toDate().toString();
  List? likes = [];
  List? comments = [];
  List? shares = [];
  List? bookMarks = [];

  PostModel(
      {this.id,
      this.userId,
      this.fullName,
      this.nickName,
      this.dateTime,
      this.postImage,
      this.postText,
      this.profilePhoto,
      this.likes,
      this.comments,
      this.shares,
      this.bookMarks});

  factory PostModel.fromMap(Map<String, dynamic> json) {
    return PostModel(
        id: json['id'],
        userId: json['userId'],
        fullName: json['fullName'],
        nickName: json['nickName'],
        profilePhoto: json['profilePhoto'],
        postImage: json['postImage'],
        dateTime: json['dateTime'],
        postText: json['postText'],
        likes: json['likes'],
        comments: json['comments'],
        shares: json['shares'],
        bookMarks: json['bookMarks']);
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'nickName': nickName,
      'profilePhoto': profilePhoto,
      'postImage': postImage,
      'dateTime': dateTime,
      'postText': postText,
      'userId': userId,
      'id': id,
      'likes': likes,
      'comments': comments,
      'shares': shares,
      'bookMarks': bookMarks
    };
  }
}
