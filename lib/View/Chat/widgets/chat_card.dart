
import 'package:chat_app/View/Chat/chat_page.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Card
    (
      child: ListTile
      (
        onTap: () 
        {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatPage()));
        },
        title: const Text('Name'),
        subtitle: const Text('Last message'),
        leading: const CircleAvatar(),
        trailing: const Badge
        (
          largeSize: 30,
          label: Text('3'),
          padding: EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }
}