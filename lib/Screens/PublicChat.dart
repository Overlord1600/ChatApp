import 'package:flutter/material.dart';
import '../Widgets/PublicChatListView.dart';

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
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              flex: 8,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: PublicChatListView(),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  const Flexible(
                    flex: 6,
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Type a message'),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: FloatingActionButton(
                      onPressed: (() {}),
                      child: const Icon(Icons.send),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
