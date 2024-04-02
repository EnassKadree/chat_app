import 'package:chat_app/View/Group/group_page.dart';
import 'package:chat_app/utils/navigator.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          onTap: () => 
          navigateTo(context, const GroupPage()),
          leading: const CircleAvatar(
            child: Text("G"),
          ),
          title: const Text("Group Name"),
          subtitle: const Text("Last Message"),
          trailing: const Badge(
            padding: EdgeInsets.symmetric(horizontal: 12),
            label: Text("3"),
            largeSize: 30,
          )),
    );
  }
}
