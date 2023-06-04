import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateMethods extends ChangeNotifier {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  Future<void> addNewMessage(Map<String, dynamic> data) async {
    await db.collection('Chats/fRJOxxrtF87geoCskILf/Messages').add(data);
  }

  Future<void> addNewChat(String uid1, String uid2) async {
    String finalChatUid = uid1 + uid2;
    db.collection('/Users/$uid1/userPrivateChatList').doc(finalChatUid);
    db.collection('/Users/$uid2/userPrivateChatList').doc(finalChatUid);
  }
}
