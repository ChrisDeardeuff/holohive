import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:holohive/services/FirebaseServices.dart';
import 'package:holohive/services/MessageService.dart';

import 'MessageCard.dart';

class ChatList extends StatelessWidget{

  const ChatList({super.key, required this.messageStream});

  // ScrollController _scrollController = ScrollController();
  // Future.delayed(const Duration(milliseconds: 100), ()
  // {
  // _scrollController.animateTo(
  // _scrollController.position.maxScrollExtent,
  // duration: const Duration(milliseconds: 300),
  // // Adjust duration as needed
  // curve: Curves.easeOut,
  // );
  // });
  final Stream<QuerySnapshot> messageStream;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: messageStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              print("yes ${snapshot.data!.docs.toString()}");
              if(snapshot.data!.docs.isEmpty){
                return const Text("No messages with contact.");
              }

              return ListView(
                //controller: _scrollController,
                children: snapshot.data!.docs
                    .map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;

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
