
import 'package:flutter/material.dart';

class CustomOutLinedButton extends StatelessWidget {
  const CustomOutLinedButton({
    super.key, required this.title, required this.onPressed,
  });
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton
    (
      style: OutlinedButton.styleFrom
      (
        padding: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed, 
      child: Center(child: Text
      (
        title.toUpperCase(),
        style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      ))
    );
  }
}
