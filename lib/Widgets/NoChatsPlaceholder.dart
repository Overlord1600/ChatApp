import 'package:flutter/material.dart';

class NoChatsPlaceholder extends StatelessWidget {
  const NoChatsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'No Chats Added Yet.Starting Chatting now!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {},
            child: const Text('Add Chats'),
          ),
        ],
      ),
    );
  }
}
