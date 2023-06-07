import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  static const routeName = '/UserDetailsScreen';
  String username;
  String userId;
  String email;
  UserDetailsScreen(this.username, this.userId, this.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'User Details',
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: const Icon(
                    Icons.person,
                    size: 170,
                  )),
            ),
            Container(
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200]),
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                child: Text(
                  'Username: $username',
                  style: const TextStyle(fontSize: 20),
                )),
            Container(
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200]),
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                child: Text(
                  'Email: $email',
                  style: const TextStyle(fontSize: 20),
                )),
            Container(
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                height: 70,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200]),
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                child: SelectableText(
                  'User ID: \n$userId',
                  style: const TextStyle(fontSize: 20),
                )),
            const Expanded(
                child: SizedBox(
              height: 10,
            )),
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Add Chat'),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
