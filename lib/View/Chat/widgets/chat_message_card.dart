
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatMessageCard extends StatelessWidget {
  const ChatMessageCard({
    super.key, required this.index
  });
  final int index; 

  @override
  Widget build(BuildContext context) {
    return Card
    (
      shape: RoundedRectangleBorder
      (
        borderRadius: BorderRadius.only
        (
          bottomLeft: Radius.circular(index % 2 ==0 ? 16 : 0),
          bottomRight: Radius.circular(index % 2 ==0 ? 0 : 16),
          topRight: const Radius.circular(16),
          topLeft: const Radius.circular(16),
        ),
      ),
      color: index % 2 == 0 ? 
        Theme.of(context).colorScheme.background :
        Theme.of(context).colorScheme.primaryContainer,
      child: Padding
      (
        padding: const EdgeInsets.all(12),
        child: Container
        (
          constraints: BoxConstraints
            (maxWidth: MediaQuery.of(context).size.width /2),
          child: Column
          (
            crossAxisAlignment: CrossAxisAlignment.end,
            children: 
            [
              const Text('Hi there every one this is my chat application'),
              Row
              (
                mainAxisSize: MainAxisSize.min,
                children: 
                [
                  Text('06:10 PM', style: Theme.of(context).textTheme.labelSmall,),
                  //const SizedBox(width: 6,),
                  index % 2 == 0 ?
                    const Icon(Iconsax.tick_circle, color: Colors.blueAccent, size: 15,) :
                    const SizedBox(),
                  const SizedBox(width: 6,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
} 