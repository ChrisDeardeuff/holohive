import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:holohive/models/Message.dart';
import 'package:holohive/models/NewsPost.dart';
import 'package:holohive/services/FirebaseServices.dart';
import 'package:uuid/uuid.dart';

import '../models/UserModel.dart';

class MessageService{

  static final MessageService _singleton = MessageService._internal();
  FirebaseServices fb = FirebaseServices();

  late String _selectedUser = '';
  late String _currentUser;

  List<UserModel> users = [];

  factory MessageService() {
    return _singleton;
  }

  MessageService._internal();

  Future<List<UserModel>> getListOfUsers() async{
    if(users.isEmpty){

      users = await fb.getAllUsers();
      selectedUser = users.first.name;
      currentUser = fb.getCurrentUser();
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
          _currentUser = currentUser;
          return;
        }
      }
      print("Contact Not Found ${currentUser} (currentUser)");
    }else{
      print("Users is Empty");

    }
  }
}