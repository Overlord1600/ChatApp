import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../Providers/AuthenticationData.dart';

class MessageBubble extends StatelessWidget {
  final data;
  final userId;
  final userName;
  final Timestamp time;
  const MessageBubble(this.data, this.userId, this.userName, this.time);

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthenticationData>(context, listen: false).fetchUserCreds();
    var format = DateFormat.Hm();
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: Provider.of<AuthenticationData>(context, listen: false)
                      .userCreds['UserId'] ==
                  userId
              ? const EdgeInsets.only(right: 10)
              : const EdgeInsets.only(left: 10),
          alignment: Provider.of<AuthenticationData>(context, listen: false)
                      .userCreds['UserId'] ==
                  userId
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Text('~$userName'),
        ),
        Row(
          mainAxisAlignment:
              Provider.of<AuthenticationData>(context, listen: false)
                          .userCreds['UserId'] ==
                      userId
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
          children: [
            if (Provider.of<AuthenticationData>(context, listen: false)
                    .userCreds['UserId'] ==
                userId)
              Container(child: Text(format.format(time.toDate()))),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Provider.of<AuthenticationData>(context, listen: false)
                              .userCreds['UserId'] ==
                          userId
                      ? const Color.fromARGB(255, 255, 187, 0)
                      : const Color.fromARGB(255, 255, 231, 158)),
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(8),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 1.5,
                  minWidth: 30),
              child: Text(data),
            ),
            if (Provider.of<AuthenticationData>(context, listen: false)
                    .userCreds['UserId'] !=
                userId)
              Container(child: Text(format.format(time.toDate()))),
          ],
        ),
      ],
    );
  }
}
