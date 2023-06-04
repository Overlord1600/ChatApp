import 'package:chat_app/Screens/PrivateChat.dart';
import 'package:chat_app/Screens/PublicChat.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ChatApp'),
            bottom: const TabBar(tabs: [
              Tab(
                text: 'Public chat room',
              ),
              Tab(
                text: 'Private chat room',
              )
            ]),
          ),
          body: const TabBarView(
              children: [PublicChatScreen(), PrivateChatScreen()]),
        ));
  }
}
