import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/Messages.dart';
import '../Providers/AuthenticationData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserKeyboard extends StatefulWidget {
  const UserKeyboard({super.key});

  @override
  State<UserKeyboard> createState() => _UserKeyboardState();
}

class _UserKeyboardState extends State<UserKeyboard> {
  TextEditingController textController = TextEditingController();
  bool emptyKeyboard = false;
  @override
  Widget build(BuildContext context) {
    Provider.of<AuthenticationData>(context, listen: false)
        .searchUsername(FirebaseAuth.instance.currentUser!.uid);
    return Row(
      children: [
        Flexible(
          flex: 6,
          child: Container(
            margin: const EdgeInsets.only(right: 5),
            child: TextField(
              onTap: () async {
                await Future.delayed(const Duration(milliseconds: 300));
                Provider.of<Messages>(context, listen: false).scroll();
              },
              textCapitalization: TextCapitalization.sentences,
              maxLines: 15,
              minLines: 1,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    emptyKeyboard = true;
                  });
                } else {
                  setState(() {
                    emptyKeyboard = false;
                  });
                }
              },
              controller: textController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                  ),
                ),
                hintText: 'Type a message',
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: FloatingActionButton(
            onPressed: emptyKeyboard == false
                ? (() {
                    Provider.of<AuthenticationData>(context, listen: false)
                        .fetchUserCreds();
                    Map<String, dynamic> data = {
                      'text': textController.text.toString(),
                      'timestamp': Timestamp.now(),
                      'userId': Provider.of<AuthenticationData>(context,
                              listen: false)
                          .userCreds['UserId'],
                      'username': Provider.of<AuthenticationData>(context,
                              listen: false)
                          .userCreds['Username'],
                    };
                    Provider.of<Messages>(context, listen: false)
                        .addNewMessage(data);
                    textController.text = '';
                  })
                : null,
            child: emptyKeyboard == false
                ? const Icon(Icons.send)
                : const Icon(Icons.mic),
          ),
        ),
      ],
    );
  }
}
