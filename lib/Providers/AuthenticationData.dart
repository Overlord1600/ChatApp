import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Screens/Authentication.dart';

class AuthenticationData extends ChangeNotifier {
  late UserCredential result;
  Map userCreds = {'UserId': '', 'Username': 'jj'};

  Future<void> userAuthentication(data, BuildContext ctx, Enum authMode) async {
    var auth = FirebaseAuth.instance;
    try {
      if (authMode == AuthMode.Login) {
        result = await auth.signInWithEmailAndPassword(
            email: data['Email'], password: data['Password']);
      } else {
        result = await auth.createUserWithEmailAndPassword(
            email: data['Email'], password: data['Password']);
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(result.user!.uid)
            .set({
          'Username': '${data['Username']}',
          'Email': '${data['Email']}'
        });
      }
      notifyListeners();
    } catch (e) {
      throw true;
    }
  }

  Future<void> fetchUserCreds() async {
    var auth1 = FirebaseAuth.instance;
    userCreds['UserId'] = auth1.currentUser!.uid;
    var res = await FirebaseFirestore.instance
        .collection('/Users')
        .doc(userCreds['UserId'])
        .get();
  }

  Future<void> searchUsername(String uid) async {
    var username =
        await FirebaseFirestore.instance.collection('/Users').doc(uid).get();
    userCreds['Username'] = username['Username'];
  }
}
