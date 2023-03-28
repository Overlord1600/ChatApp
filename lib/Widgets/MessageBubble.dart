import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final data;
  final userId;
  const MessageBubble(this.data, this.userId);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: MediaQuery.of(context).size.width / 2,
      child: Container(
        color: Colors.amber,
        child: Text(
          data,
          softWrap: true,
        ),
      ),
    );
  }
}
