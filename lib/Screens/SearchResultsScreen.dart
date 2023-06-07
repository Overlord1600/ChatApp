import 'package:chat_app/Providers/FetcherMethods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/SearchSuggestionTile.dart';

class SearchScreen extends StatefulWidget {
  static const path = '/SearchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, String>> res = [];
  List<Map<String, String>> allUserId = [];
  Future<void> callMethodForUserIdFetch() async {
    await Provider.of<FetcherMethods>(context).fetchAllUserId().then((value) {
      allUserId = value;
    });
  }

  @override
  void didChangeDependencies() {
    callMethodForUserIdFetch();
    super.didChangeDependencies();
  }

  bool isQueryEmpty = true;
  TextEditingController ctrl = TextEditingController(text: '');
  List<Map<String, String>> filteredSearchSuggestions = [];
  void makeSearchSuggestionsList(value) {
    res = allUserId.where((element) {
      return element['UserId']!.contains(value);
    }).toList();
    setState(() {
      filteredSearchSuggestions = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Search-bar-animate',
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 35, left: 10, right: 10),
              height: 43,
              child: TextField(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      if (isQueryEmpty) {
                        null;
                      } else {
                        setState(() {
                          isQueryEmpty = true;
                        });
                      }
                    } else {
                      if (!isQueryEmpty) {
                        makeSearchSuggestionsList(value);
                      } else {
                        setState(() {
                          isQueryEmpty = false;
                        });
                      }
                    }
                  },
                  controller: ctrl,
                  decoration: InputDecoration(
                    filled: true,
                    focusColor: Colors.grey[100],
                    fillColor: Colors.grey[100],
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: 'Search for Users',
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
            if (isQueryEmpty == false)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    itemCount: filteredSearchSuggestions.length,
                    itemBuilder: (context, index) {
                      return SearchSuggestionTile(
                          filteredSearchSuggestions[index]['Username']
                              as String,
                          filteredSearchSuggestions[index]['Username']
                              as String);
                    },
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
