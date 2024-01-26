import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:holohive/services/FirebaseServices.dart';
import 'package:holohive/services/MessageService.dart';

import 'MessageCard.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key, required this.user});

  final String user;

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  FirebaseServices fb = FirebaseServices();
  MessageService ms = MessageService();

  ScrollController _scrollController = ScrollController();
  Stream<QuerySnapshot> _messageStream = Stream.empty();

  @override
  void initState() {
    super.initState();
    print('getting new listener for: ${ms.currentUser} and ${ms.selectedUser}');
    _messageStream = fb.getListener(ms.currentUser, ms.selectedUser);

    Future.delayed(const Duration(milliseconds: 100), ()
    {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        // Adjust duration as needed
        curve: Curves.easeOut,
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: _messageStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView(
                controller: _scrollController,
                children: snapshot.data!.docs
                    .map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;

                      if(data.isEmpty){
                        return const Text("No messages with contact.");
                      }
                      return MessageCard(
                          sender: data['sender'],
                          receiver: data['receiver'],
                          time: data['date'],
                          message: data['message']);
                    })
                    .toList()
                    .cast(),
              );
            },
          ),
        ),
      ],
    );
  }
}
