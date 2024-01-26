import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Message {
  final String uuid = Uuid().v4();
  final String sender;
  final String receiver;
  final Timestamp date;
  final String message;

  Message({required this.sender,  required this.receiver, required this.date, required this.message});

}