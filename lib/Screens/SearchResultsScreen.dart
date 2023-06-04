import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const path = '/SearchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController ctrl = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Search-bar-animate',
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5,
                  offset: const Offset(4, 6), // Shadow position
                ),
              ]),
              margin: const EdgeInsets.only(top: 35, left: 10, right: 10),
              height: 43,
              child: TextField(
                  controller: ctrl,
                  decoration: InputDecoration(
                    filled: true,
                    focusColor: Colors.grey[100],
                    fillColor: Colors.grey[100],
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: 'Search',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
