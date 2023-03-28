import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Screens/Authentication.dart';

class AuthenticationData extends ChangeNotifier {
  late UserCredential result;
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
}
