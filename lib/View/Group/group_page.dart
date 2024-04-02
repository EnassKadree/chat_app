import 'package:chat_app/View/Group/group_member.dart';
import 'package:chat_app/View/Group/widgets/group_message_card.dart';
import 'package:chat_app/utils/helpers/navigator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Name"),
            Text(
              "ahmad, nabil, mohamad .... ",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(context, const GroupMemberScreen());
            },
            icon: const Icon(Iconsax.user),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Iconsax.copy),
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GroupMessageCard(
                    index: index,
                  );
                },
              ),
              // child: Center(
              //   child: GestureDetector(
              //     child: Card(
              //       child: Padding(
              //         padding: const EdgeInsets.all(12.0),
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               "👋",
              //               style: Theme.of(context).textTheme.displayMedium,
              //             ),
              //             SizedBox(
              //               height: 16,
              //             ),
              //             Text(
              //               "Say Assalamu Alaikum",
              //               style: Theme.of(context).textTheme.bodyMedium,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: TextField(
                      maxLines: 5,
                      minLines: 1,
                      decoration: InputDecoration(
                          suffixIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Iconsax.emoji_happy),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Iconsax.camera),
                              ),
                            ],
                          ),
                          border: InputBorder.none,
                          hintText: "Message",
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10)),
                    ),
                  ),
                ),
                IconButton.filled(onPressed: () {}, icon: const Icon(Iconsax.send_1))
              ],
            )
          ],
        ),
      ),
    );
  }
}
