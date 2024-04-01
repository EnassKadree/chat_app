
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SendMessageFromField extends StatelessWidget {
  const SendMessageFromField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded
    (
      child: Card
      (
        child: TextField
        (
          maxLines: 5,
          minLines: 1,
          decoration: InputDecoration
          (
            suffixIcon: Row
            (
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: 
              [
                IconButton
                (
                  onPressed: (){}, 
                  icon: const Icon(Iconsax.camera)
                ),
                IconButton
                (
                  onPressed: (){}, 
                  icon: const Icon(Iconsax.emoji_happy)
                )
              ],
            ),
            border: InputBorder.none,
            hintText: 'Message',
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          ),
        ),
      )
    );
  }
}
