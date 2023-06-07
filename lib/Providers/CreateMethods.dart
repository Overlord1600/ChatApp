import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateMethods extends ChangeNotifier {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  Future<void> addNewMessage(Map<String, dynamic> data) async {
    await db.collection('Chats/fRJOxxrtF87geoCskILf/Messages').add(data);
  }

  Future<Map> addNewChat(String uid1, String uid2) async {
    String finalChatUid = '$uid1%$uid2';
    Map newAddedChatData = {
      'docId': '',
    };
    await db
        .collection('/Users/$uid1/userPrivateChatList')
        .doc(finalChatUid)
        .set({'User1UID': uid1, 'User2UID': uid2});
    await db
        .collection('/Users/$uid2/userPrivateChatList')
        .doc(finalChatUid)
        .set({'User1UID': uid2, 'User2UID': uid1});
    newAddedChatData['docId'] = finalChatUid;
    return newAddedChatData;
  }
}
