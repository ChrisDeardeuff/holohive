import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatefulWidget {
  const MessageCard(
      {super.key,
      required this.sender,
      required this.receiver,
      required this.time,
      required this.message});

  final String sender;
  final String receiver;
  final Timestamp time;
  final String message;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  DateTime date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = (widget.time as Timestamp).toDate();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.background,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(widget.sender,
                style: Theme.of(context).textTheme.titleLarge),
            subtitle: Text("${date.year}/${date.month}/${date.day}",
                style: Theme.of(context).textTheme.titleSmall),
          ),
          Row(
            children: [
              const Spacer(flex: 1),
              Expanded(
                  flex: 10,
                  child: Text(
                      widget.message,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.left)
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 10))
        ],
      ),
    );
  }
}
