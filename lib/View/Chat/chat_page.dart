import 'package:chat_app/View/Chat/widgets/send_message_form_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        title:  Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          [
            const Text('Enass'),
            Text('last seen: 11:30 AM', style: Theme.of(context).textTheme.labelMedium,),
          ],
        ),
        actions: 
        [
          IconButton(onPressed: (){}, icon: const Icon(Iconsax.trash),),
          IconButton(onPressed: (){}, icon: const Icon(Iconsax.copy),)
        ],
      ),
      body: Padding
      (
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column
        (
          children: 
          [
            Expanded
            (
              // child: ListView.builder
              // (
              //   reverse: true,
              //   itemCount: 5,
              //   itemBuilder: (context, index)
              //   {
              //     return Row
              //     (
              //       mainAxisAlignment: index % 2 == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
              //       children: 
              //       [
              //         index % 2 == 0 ?
              //         IconButton
              //         (
              //           onPressed: (){}, 
              //           icon: const Icon(Iconsax.message_edit)
              //         ) :
              //         const SizedBox(),

              //         ChatMessageCard(index: index)
              //       ],
              //     );
              //   }
              // )
              child: Center
              (
                child: GestureDetector
                (
                  onTap: (){},
                  child: Card
                  (
                    child: Padding
                    (
                      padding: const EdgeInsets.all(20),
                      child: Column
                      (
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: 
                        [
                          Text(
                          "👋",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Say Assalamu Alaykum",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row
            (
              children: 
              [
                const SendMessageFromField(),
                IconButton.filled(onPressed: (){}, icon: const Icon(Iconsax.send_1))
              ],
            )
          ],
        ),
      ),
    );
  }
}
