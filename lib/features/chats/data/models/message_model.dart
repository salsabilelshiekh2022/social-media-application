import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderId;
  final String receiverId;
  final String? text;
  String? dateTime = Timestamp.now().toDate().toString();
  String? file;

  MessageModel({
    required this.senderId,
    required this.receiverId,
    this.text,
    this.dateTime,
    this.file,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      text: map['text'],
      dateTime: map['dateTime'],
      file: map['file'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'dateTime': dateTime,
      'file': file,
    };
  }
}
