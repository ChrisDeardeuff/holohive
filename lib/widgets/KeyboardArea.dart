import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:holohive/models/Message.dart';
import 'package:holohive/services/FirebaseServices.dart';
import 'package:holohive/services/MessageService.dart';

class KeyboardArea extends StatefulWidget {
  const KeyboardArea({super.key});

  @override
  State<KeyboardArea> createState() => _KeyboardAreaState();
}

class _KeyboardAreaState extends State<KeyboardArea> {

  MessageService ms = MessageService();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.primary, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                  controller: _messageController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  keyboardAppearance: Brightness.dark,
                  decoration: const InputDecoration(border: InputBorder.none)),
            )),
        Expanded(
            flex: 2,
            child: IconButton(
              icon: Icon(Icons.send),
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {
                ms.sendNewMessage(_messageController.text);
                _messageController.text = '';
              },
            ))
      ],
    );
  }
}
