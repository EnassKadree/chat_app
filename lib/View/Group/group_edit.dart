import 'package:chat_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EditGroupPage extends StatefulWidget {
  const EditGroupPage({super.key});

  @override
  State<EditGroupPage> createState() => _EditGroupPageState();
}

class _EditGroupPageState extends State<EditGroupPage> {
  TextEditingController gNameCon = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gNameCon.text = " Name";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text("Done"),
          icon: const Icon(Iconsax.tick_circle),
        ),
        appBar: AppBar(
          title: const Text("Edit Group"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                        ),
                        Positioned(
                            bottom: -10,
                            right: -10,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add_a_photo)))
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: CustomTextFiled(
                      controller: gNameCon,
                      icon: Iconsax.user_octagon,
                      hint: "Group Name",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              const Row(
                children: [
                  Text("Add Members"),
                  Spacer(),
                  Text("0"),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                  child: ListView(
                children: [
                  CheckboxListTile(
                    checkboxShape: const CircleBorder(),
                    title: const Text("Nabil"),
                    value: true,
                    onChanged: (value) {},
                  ),
                  CheckboxListTile(
                    checkboxShape: const CircleBorder(),
                    title: const Text("Nabil"),
                    value: false,
                    onChanged: (value) {},
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}