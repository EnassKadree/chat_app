import 'package:chat_app/Firebase/fire_auth.dart';
import 'package:chat_app/View/Auth/login_page.dart';
import 'package:chat_app/layout.dart';
import 'package:chat_app/utils/helpers/navigator.dart';
import 'package:chat_app/Widget/elevated_button.dart';
import 'package:chat_app/Widget/logo.dart';
import 'package:chat_app/Widget/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SetupProfile extends StatefulWidget 
{
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> 
{
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        actions: 
        [
          IconButton
          (
            onPressed: ()
            {
              FirebaseAuth.instance.signOut(); 
              navigateRemoveUntil(context, const LoginPage());
            }, 
            icon: const Icon(Iconsax.logout_1)
          )
        ],
      ),
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
              Text('Welcome', style: Theme.of(context).textTheme.displayMedium,),
              Text('let\'t setup your profile', style: Theme.of(context).textTheme.headlineSmall,),
              const SizedBox(height: 12,),
              Text('Enter your name', style: Theme.of(context).textTheme.bodyLarge,),
              Form
              (
                key: formKey,
                child: Column
                (
                  children: 
                  [
                    CustomTextFiled(hint: 'name', icon: Iconsax.direct, controller: nameController,),
                    const SizedBox(height: 16,),
                    CustomElevatedButton(title: 'Continue', onPressed: () async
                    {
                      if(formKey.currentState!.validate())
                      {
                        await FirebaseAuth.instance.currentUser!.
                          updateDisplayName(nameController.text).
                            then((value) { FireAuth().createUser(); navigateRemoveUntil(context, const Layout());});
                          
                      }
                    },),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
