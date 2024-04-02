import 'package:chat_app/View/Group/create_group.dart';
import 'package:chat_app/View/Group/widgets/group_card.dart';
import 'package:chat_app/utils/helpers/navigator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class GroupsHomePage extends StatefulWidget {
  const GroupsHomePage({super.key});

  @override
  State<GroupsHomePage> createState() => _GroupsHomePageState();
}

class _GroupsHomePageState extends State<GroupsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateTo(context, const CreateGroupPage());
          },
          child: const Icon(Iconsax.message_add_1),
        ),
        appBar: AppBar(
          title: const Text("Group"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const GroupCard();
                },
              ))
            ],
          ),
        ));
  }
}
