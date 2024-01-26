import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:holohive/models/Message.dart';
import 'package:holohive/models/NewsPost.dart';
import 'package:holohive/services/FirebaseServices.dart';
import 'package:uuid/uuid.dart';

import '../models/User.dart';

class MessageService{

  static final MessageService _singleton = MessageService._internal();
  FirebaseServices fb = FirebaseServices();

  late String _selectedUser = 'Cane Randal';
  final String _currentUser = 'DM';

  List<User> users = [];

  factory MessageService() {
    return _singleton;
  }

  MessageService._internal();

  Future<List<User>> getListOfUsers() async{
    if(users.isEmpty){

      users = await fb.getAllUsers();
      selectedUser = users.first.name;
    }
    return users;
  }

   sendNewMessage(String message) async{

    await fb.sendMessage(Message(sender: _currentUser, receiver: selectedUser, date: Timestamp.now(), message: message));
  }

  //GETTERS AND SETTERS
  String get selectedUser => _selectedUser;

  set selectedUser(String userName) {
    if(users.isNotEmpty){

      for(var user in users){
        if(user.name == userName){
          _selectedUser = userName;
        }
      }
    }else{
      print("Contact Not Found: $userName (selectedUser)");
    }
  }
  String get currentUser => _currentUser;
  set currentUser(String currentUser){
    if(users.isNotEmpty){

      for(var user in users){
        if(user.name == currentUser){
          _selectedUser = currentUser;
        }
      }
    }else{
      print("Contact Not Found ${currentUser} (currentUser)");
    }
  }
}