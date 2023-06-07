import 'package:chat_app/Providers/CreateMethods.dart';
import 'package:chat_app/Providers/FetcherMethods.dart';
import 'package:chat_app/Widgets/PublicChatListView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchSuggestionTile extends StatelessWidget {
  String Username;
  String UserId;
  SearchSuggestionTile(this.Username, this.UserId);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(UserId),
      title: Text('@$Username'),
      subtitle: Text('@$UserId'),
      trailing: TextButton(
        child: const Text('Add'),
        onPressed: () async {
          bool status =
              await Provider.of<FetcherMethods>(context, listen: false)
                  .fetchChatStatusWithOtherUser(
                      Provider.of<FetcherMethods>(context, listen: false)
                          .fetchActiveUserId(),
                      UserId);
          if (status == true) {
            Map fetchData = await Provider.of<CreateMethods>(context)
                .addNewChat(
                    Provider.of<FetcherMethods>(context, listen: false)
                        .fetchActiveUserId(),
                    UserId);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) {
                return PublicChatListView(
                    '/Users/${Provider.of<FetcherMethods>(context, listen: false).fetchActiveUserId()}/userPrivateChatList/${fetchData['docId']}');
              },
            ));
          }
        },
      ),
    );
  }
}
