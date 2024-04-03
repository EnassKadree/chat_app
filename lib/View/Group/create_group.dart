import 'package:chat_app/Widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class CreateGroupPage extends StatefulWidget 
{
  const CreateGroupPage({super.key});

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> 
{
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: const Text('Create Group'),),
      floatingActionButton: FloatingActionButton.extended
      (
        onPressed: (){},
        label: const Text('Done'),
        icon: const Icon(Iconsax.tick_circle),
      ),
      body: Padding
      (
        padding: const EdgeInsets.all(20),
        child: Column
        (
          children: 
          [
            Row
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [
                Stack
                (
                  clipBehavior: Clip.none,
                  children: 
                  [
                    const CircleAvatar(radius: 40,),
                    Positioned
                    (
                      bottom: -10, right: -10,
                      child: IconButton(icon: const Icon(Icons.add_a_photo), onPressed: (){},)
                    )
                  ],
                ),
                const SizedBox(width: 16,),
                Expanded(child: CustomTextFiled(hint: 'Group name', icon: Iconsax.user_octagon, controller: controller)),
              ],
            ),
            const SizedBox(height: 16,),
            const Divider(),
            const SizedBox(height: 16,),
            const Row(children: [Text('Members'), Spacer(), Text('0')],),
            const SizedBox(height: 16,),
            CheckboxListTile(value: true, onChanged: (value){}, title: const Text('Enass'), checkboxShape: const CircleBorder(),),
            CheckboxListTile(value: false, onChanged: (value){}, title: const Text('Joudy'), checkboxShape: const CircleBorder(),),
          ],
        ),
      ),
    );
  }
}