import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomTextFiled extends StatefulWidget {
  const CustomTextFiled({super.key, required this.hint, required this.icon, this.isPass = false, required this.controller});
  final String hint;
  final IconData icon; 
  final bool isPass;
  final TextEditingController controller; 

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding
    (
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField
      (
        validator: (value) => value!.isEmpty ? '${widget.hint} is required' : null,
        controller: widget.controller,
        obscureText: widget.isPass? isObscure : false, 
        decoration: InputDecoration
        (
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: widget.hint,
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isPass? 
          IconButton
          (
            onPressed: ()
            {
              setState(() {
                isObscure = !isObscure;
              });
            }, 
            icon: const Icon(Iconsax.eye)
          ) : const SizedBox()
        ),
      ),
    );
  }
}