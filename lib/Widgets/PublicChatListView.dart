import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Widgets/MessageBubble.dart';

class PublicChatListView extends StatelessWidget {
  const PublicChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Chats/fRJOxxrtF87geoCskILf/Messages')
              .snapshots(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            final chatList = snapshot.data!.docs;
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  return MessageBubble(chatList[index]['Text'], null);
                }));
          })),
    );
  }
}
