import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Widgets/MessageBubble.dart';
import 'package:provider/provider.dart';
import '../Providers/Messages.dart';

class PublicChatListView extends StatelessWidget {
  String path;
  PublicChatListView(this.path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('/Chats/fRJOxxrtF87geoCskILf/Messages')
              .orderBy('timestamp')
              .snapshots(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data == null) {
              return const Center(
                child: Text('No Messages'),
              );
            } else {
              final chatList = snapshot.data!.docs;
              Provider.of<Messages>(context, listen: false).scroll();
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller:
                      Provider.of<Messages>(context, listen: false).controller,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: ((context, index) {
                    return MessageBubble(
                        chatList[index]['text'],
                        chatList[index]['userId'],
                        chatList[index]['username'],
                        chatList[index]['timestamp'] as Timestamp);
                  }));
            }
          })),
    ));
  }
}
