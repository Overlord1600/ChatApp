import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FetcherMethods extends ChangeNotifier {
  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;

  String fetchActiveUserId() {
    String userId = auth.currentUser!.uid;
    return userId;
  }

  Future<List<Map<String, String>>> fetchAllUserId() async {
    List<Map<String, String>> allUserIdList = [];

    await db.collection('/Users').get().then((value) {
      print(value.docs.toList());
      for (var element in value.docs.toList()) {
        Map<String, String> userDetails = {
          'UserId': '',
          'Username': '',
          'Email': ''
        };
        userDetails['UserId'] = element.id;
        userDetails['Username'] = element.data()['Username'];
        userDetails['Email'] = element.data()['Email'];
        allUserIdList.add(userDetails);
      }
    });

    return allUserIdList;
  }

  Future<String> fetchUsername(String uid) async {
    Map<String, dynamic> username = {};
    await db.collection('/Users').doc(uid).get().then((value) {
      username = value.data() as Map<String, dynamic>;
    });
    return username['Username'];
  }

  Future<List<String>> fetchUserChatList(String uid) async {
    List<String> allChats = [];
    await db.collection('/Users/$uid/userPrivateChatList').get().then((value1) {
      for (var element in value1.docs) {
        allChats.add(element.id);
      }
    });
    return allChats;
  }

  Future<bool> fetchChatStatusWithOtherUser(String uid1, String uid2) async {
    bool user1Status = false;
    bool user2Status = false;
    List<String> allChatsForUser1 = await fetchUserChatList(uid1);
    List<String> allChatsForUser2 = await fetchUserChatList(uid2);
    for (var element in allChatsForUser1) {
      if (element.contains(uid1) && element.contains(uid2)) {
        user1Status = true;
      }
    }
    for (var element in allChatsForUser2) {
      if (element.contains(uid1) && element.contains(uid2)) {
        user2Status = true;
      }
    }
    if (user1Status == true && user2Status == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<Map<String, double>> fetchDeviceDimensions(BuildContext ctx) async {
    double deviceHeight = MediaQuery.of(ctx).size.height;
    double deviceWidth = MediaQuery.of(ctx).size.width;
    var deviceMap = {'height': deviceHeight, 'width': deviceWidth};
    return deviceMap;
  }
}
