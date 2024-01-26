import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:holohive/models/Message.dart';
import 'package:holohive/models/NewsPost.dart';
import 'package:uuid/uuid.dart';

import '../firebase_options.dart';
import '../models/User.dart';

class FirebaseServices {
  static final FirebaseServices _singleton = FirebaseServices._internal();

  late FirebaseFirestore db;

  factory FirebaseServices() {
    return _singleton;
  }

  FirebaseServices._internal();

  initializeFB() async {
    print("Initializing Firebase");
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    db = FirebaseFirestore.instance;
  }

  Future<List<Message>> getMessages(String current, String selected) async {
    // Sort the names alphabetically to ensure consistent order.
    final sortedNames = [current, selected]..sort();
    // Join the sorted names using an underscore.
    String path = sortedNames.join('_');

    List<Message> ms = [];
    final snapshot = await FirebaseFirestore.instance
        .collection(path)
        .get()
        .then((querySnapshot) => {
              print(
                  'Received all messages: ${querySnapshot.docs.length} documents'),
              for (var docSnap in querySnapshot.docs)
                {
                  ms.add(Message(
                      sender: docSnap.data()['sender'],
                      receiver: docSnap.data()['receiver'],
                      date: docSnap.data()['date'] as Timestamp,
                      message: docSnap.data()['message']))
                }
            });

    return ms;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getListener(
      String current, String selected) {
    // Sort the names alphabetically to ensure consistent order.
    final sortedNames = [current, selected]..sort();
    // Join the sorted names using an underscore.
    String path = sortedNames.join('_');

    return db.collection(path).orderBy('date').snapshots();
  }

  getListener2(String path) {
    FirebaseFirestore.instance.collection(path).snapshots().map((snapshot) {
      print('Received snapshot: ${snapshot.docs.length} documents (listener2)');
    });
  }

  sendMessage(Message message) async {
    // Sort the names alphabetically to ensure consistent order.
    final sortedNames = [message.sender, message.receiver]..sort();
    // Join the sorted names using an underscore.
    String path = sortedNames.join('_');

    final chat = db.collection(path);
    chat.add({
      'uuid': message.uuid,
      'sender': message.sender,
      'receiver': message.receiver,
      'message': message.message,
      'date': message.date
    });
  }

  Future<List<User>> getAllUsers() async {
    List<User> users = [];

    final news = db.collection("users");

    await news.get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print("adding user");
          users.add(User(name: docSnapshot.data()['name']));
        }
      },
      onError: (e) => print("Error completing: $e"),
    );

    return users;
  }

  Future<List<NewsPost>> getAllNews() async {
    List<NewsPost> nps = [];

    final news = db.collection("news");

    await news.get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print("adding post");
          nps.add(NewsPost(
              headline: docSnapshot.data()['headline'],
              body: docSnapshot.data()['body'],
              date: docSnapshot.data()['date'],
              agency: docSnapshot.data()['agency']));
        }
      },
      onError: (e) => print("Error completing: $e"),
    );

    return nps;
  }
}
