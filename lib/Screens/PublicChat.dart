import 'package:flutter/material.dart';
import '../Widgets/PublicChatListView.dart';
import '../Widgets/UserInputKeyboard.dart';

class PublicChatScreen extends StatefulWidget {
  const PublicChatScreen({super.key});

  @override
  State<PublicChatScreen> createState() => _PublicChatScreenState();
}

class _PublicChatScreenState extends State<PublicChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(right: 5, left: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child:
                  // ignore: prefer_const_constructors
                  PublicChatListView('/Chats/fRJOxxrtF87geoCskILf/Messages'),
            ),
            Container(
                constraints: const BoxConstraints(maxHeight: 90),
                padding: const EdgeInsets.all(9),
                child: const UserKeyboard())
          ],
        ),
      ),
    );
  }
}
