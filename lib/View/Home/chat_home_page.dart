import 'package:chat_app/View/Chat/chat_card.dart';
import 'package:chat_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatsHomePage extends StatefulWidget 
{
  const ChatsHomePage({super.key});

  @override
  State<ChatsHomePage> createState() => _ChatsHomePageState();
}

class _ChatsHomePageState extends State<ChatsHomePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      floatingActionButton: FloatingActionButton
      (
        onPressed: ()
        {
          showBottomSheet
          (
            context: context, 
            builder: (context)
            {
              return Container
              (
                child: Padding
                (
                  padding: const EdgeInsets.all(20),
                  child: Column
                  (
                    mainAxisSize: MainAxisSize.min,
                    children: 
                    [
                      Row
                      (
                        children: 
                        [
                          Text('Enter friend email', style: Theme.of(context).textTheme.bodyLarge,),
                          const Spacer(),
                          IconButton.filled(onPressed: (){}, icon: const Icon(Iconsax.scan_barcode))
                        ],
                      ),
                      CustomTextFiled(hint: 'Email', icon: Iconsax.direct, controller: controller),
                      SizedBox(height: 16,),
                      ElevatedButton
                      (
                        style: ElevatedButton.styleFrom
                        (
                          shape: RoundedRectangleBorder
                          (
                            borderRadius: BorderRadius.circular(12)
                          ),
                          backgroundColor: Theme.of(context).colorScheme.primaryContainer
                        ),
                        onPressed: (){}, 
                        child: const Center(child: Text('Create chat'),)
                      )
                    ],
                  ),
                )
              );
            }
          );
        },
        child: const Icon(Iconsax.message_add),
      ),
      appBar: AppBar(title: const Text('Chats'),),
      body: Padding
      (
        padding: const EdgeInsets.all(20),
        child: Column
        (
          children: 
          [
            Expanded
            (
              child: ListView.builder
              (
                itemCount: 20,
                itemBuilder: (context, index)
                {
                  return const ChatCard();
                }
              )
            )
          ],
        ),
      ),
    );
  }
}
