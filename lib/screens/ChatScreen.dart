import 'package:flutter/material.dart';
import 'package:holohive/services/MessageService.dart';
import 'package:holohive/widgets/ChatList.dart';

import '../models/User.dart';
import '../widgets/KeyboardArea.dart';
import '../widgets/TopBar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  MessageService ms = MessageService();

  List<String> contactLists = [];
  String lUser = '';
  @override
  void initState() {
    ms.currentUser = "Cane Randal";
    super.initState();
  }

  Future<List<String>> initContacts() async {
    List<String> contactLists = [];
    await ms.getListOfUsers();
    for (User user in await ms.getListOfUsers()) {
      contactLists.add(user.name);
    }

    return contactLists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              const TopBar(),
                  FutureBuilder(
                    future: initContacts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        print("SNAPSHOT DONE: ${snapshot.data}");
                        final List<String> contactNames = snapshot.data as List<String>;
                        return Row(
                          children: [
                            const Text("Chatting With: "),
                            DropdownButton(
                                dropdownColor: Theme.of(context).colorScheme.background,
                                value: ms.selectedUser,
                                items: contactNames.map<DropdownMenuItem>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  if (newValue != null) {
                                    print('Update');
                                    ms.selectedUser = newValue as String;
                                    setState((){
                                      print('Update State');
                                      lUser = newValue;
                                    });
                                  }
                                }),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text("Error loading contacts: ${snapshot.error}");
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
              Divider(
                color: Theme.of(context).colorScheme.primary,
              ),
              Expanded(child: ChatList(user: lUser)),
              Divider(
                color: Theme.of(context).colorScheme.primary,
              ),
              const KeyboardArea(),
            ])));
  }
}
