import 'package:chat_app/widgets/elevated_button.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:chat_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordPage extends StatefulWidget 
{
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> 
{
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar(),
      body: SingleChildScrollView
      (
        child: Padding
        (
          padding: const EdgeInsets.all(20),
          child: Column
          (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: 
            [
              const Logo(),
              const SizedBox(height: 16,),
              Text('Forget password', style: Theme.of(context).textTheme.headlineLarge,),
              Text('Please enter your email', style: Theme.of(context).textTheme.bodyLarge,),
              CustomTextFiled(hint: 'Email', icon: Iconsax.direct, controller: emailController,),
              const SizedBox(height: 16,),
              CustomElevatedButton(title: 'Send Email', onPressed: ()
              {
                Navigator.of(context).pop(context);
              },),
            ],
          ),
        ),
      ),
    );
  }
}
