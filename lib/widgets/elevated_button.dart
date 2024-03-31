
import 'package:chat_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, required this.title, required this.onPressed,
  });
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton
    (
      style: ElevatedButton.styleFrom
      (
        padding: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: kPrimaryColor,
      ),
      onPressed: onPressed, 
      child: Center(child: Text
      (
        title.toUpperCase(),
        style: const TextStyle(color: Colors.black),
      ))
    );
  }
}