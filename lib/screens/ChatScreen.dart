import 'package:flutter/material.dart';
import 'package:holohive/services/FirebaseServices.dart';
import 'package:holohive/services/MessageService.dart';
import 'package:holohive/widgets/ChatList.dart';

import '../models/UserModel.dart';
import '../widgets/KeyboardArea.dart';
import '../widgets/TopBar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  MessageService ms = MessageService();
  FirebaseServices fb = FirebaseServices();

  List<String> contactLists = [];

  @override
  void initState() {
    print("Current user: ${ms.currentUser}");
    super.initState();
  }

  Future<List<String>> initContacts() async {
    List<String> contactLists = [];
    await ms.getListOfUsers();
    for (UserModel user in await ms.getListOfUsers()) {
      contactLists.add(user.name);
    }

    fb.getListener(ms.currentUser, ms.selectedUser);

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
                                    setState((){
                                      ms.selectedUser = newValue;
                                      print('Update State');
                                      print('Selected User is: ${ms.selectedUser}');
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
              Expanded(child: ChatList(messageStream: fb.getListener(ms.currentUser, ms.selectedUser))),
              Divider(
                color: Theme.of(context).colorScheme.primary,
              ),
              const KeyboardArea(),
            ])));
  }
}
