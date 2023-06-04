import 'package:flutter/material.dart';
import '../Widgets/NoChatsPlaceholder.dart';

class PrivateChatScreen extends StatefulWidget {
  const PrivateChatScreen({super.key});

  @override
  State<PrivateChatScreen> createState() => _PrivateChatScreenState();
}

class _PrivateChatScreenState extends State<PrivateChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Search-bar-animate',
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Chats',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                ),
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                    offset: const Offset(4, 7), // Shadow position
                  ),
                ]),
                height: 43,
                child: TextField(
                    keyboardType: TextInputType.none,
                    onTap: () =>
                        Navigator.of(context).pushNamed('/SearchScreen'),
                    decoration: InputDecoration(
                      filled: true,
                      focusColor: Colors.grey[100],
                      fillColor: Colors.grey[100],
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.only(left: 20),
                      hintText: 'Tap to enter Search',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade100)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade100)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade100)),
                    )),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 4),
                  child: const NoChatsPlaceholder())
            ],
          ),
        ),
      ),
    );
  }
}
