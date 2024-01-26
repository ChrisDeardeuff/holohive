import 'package:cloud_firestore/cloud_firestore.dart';

class NewsPost {
  final String headline;
  final String body;
  final Timestamp date;
  final String agency;

  NewsPost({required this.headline, required this.body, required this.date, required this.agency});

  factory NewsPost.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return NewsPost(
        headline: data?['headline'], body: data?['body'], date: data?['date'], agency: data?['agency']);
  }
}
