import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderId;
  final String receiverId;
  final String? text;
  DateTime dateTime = Timestamp.now().toDate();
  String? file;

  MessageModel({
    required this.senderId,
    required this.receiverId,
    this.text,
    required this.dateTime,
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
