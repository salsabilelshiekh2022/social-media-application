class UserModel {
  String? fullName;
  String? nickName;
  String? phone;
  String? gender;
  String email;
  String uId;
  String? bio;
  String? profilePhoto;
  String? coverPhoto;
  String? address;

  UserModel(
      {required this.email,
      required this.uId,
      this.fullName,
      this.nickName,
      this.phone,
      this.gender,
      this.bio,
      this.profilePhoto,
      this.coverPhoto,
      this.address});

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'],
      nickName: json['nickName'],
      phone: json['phone'],
      gender: json['gender'],
      email: json['email'],
      uId: json['uId'],
      bio: json['bio'],
      profilePhoto: json['profilePhoto'],
      coverPhoto: json['coverPhoto'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'nickName': nickName,
      'phone': phone,
      'gender': gender,
      'email': email,
      'uId': uId,
      'bio': bio,
      'profilePhoto': profilePhoto,
      'coverPhoto': coverPhoto,
      'address': address
    };
  }
}
