class PostModel {
  String? fullName;
  String? nickName;
  String? profilePhoto;
  String? postText;
  String? postImage;
  String? dateTime;

  PostModel(
      {this.fullName,
      this.nickName,
      this.dateTime,
      this.postImage,
      this.postText,
      this.profilePhoto});

  factory PostModel.fromMap(Map<String, dynamic> json) {
    return PostModel(
        fullName: json['fullName'],
        nickName: json['nickName'],
        profilePhoto: json['profilePhoto'],
        postImage: json['postImage'],
        dateTime: json['dateTime'],
        postText: json['postText']);
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'nickName': nickName,
      'profilePhoto': profilePhoto,
      'postImage': postImage,
      'dateTime': dateTime,
      'postText': postText,
    };
  }
}
