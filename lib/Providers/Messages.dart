import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends ChangeNotifier {
  ScrollController controller = ScrollController();
  void scroll() {
    controller.jumpTo(controller.position.maxScrollExtent);
  }

  Future<void> addNewMessage(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection('Chats/fRJOxxrtF87geoCskILf/Messages')
        .add(data);
  }
}
