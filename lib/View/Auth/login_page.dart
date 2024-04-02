import 'package:chat_app/View/Auth/forget_password_page.dart';
import 'package:chat_app/layout.dart';
import 'package:chat_app/utils/helpers/navigator.dart';
import 'package:chat_app/utils/helpers/show_snack_bar.dart';
import 'package:chat_app/widgets/elevated_button.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:chat_app/widgets/outlined_button.dart';
import 'package:chat_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatefulWidget 
{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> 
{
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
              Text('Welcome Back,', style: Theme.of(context).textTheme.headlineLarge,),
              Text('Material Chat app with Enass Al-Kadree', style: Theme.of(context).textTheme.bodyLarge,),
              Form
              (
                key: formKey,
                child: Column
                (
                  children: 
                  [
                    CustomTextFiled(hint: 'Email', icon: Iconsax.direct, controller: emailController,),
                    CustomTextFiled(hint: 'Password', icon: Iconsax.password_check, controller: passController, isPass: true,),
                    const SizedBox(height: 16,),
                    Row
                    (
                      children: 
                      [
                        const Spacer(),
                        GestureDetector
                        (
                          onTap: ()
                          {
                            navigateTo(context, const ForgetPasswordPage());
                          },
                          child: const Text('Forgot password?'),
                        )
                      ],
                    ),
                    const SizedBox(height: 16,),
                    CustomElevatedButton(title: 'login', onPressed: () async
                    {
                      if(formKey.currentState!.validate())
                      {
                        try 
                        {
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passController.text
                          );
                          navigateRemoveUntil(context, const Layout());
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            ShowSnackBar(context, 'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            ShowSnackBar(context, 'Wrong password provided for that user.');
                          }
                          else 
                          {
                            ShowSnackBar(context, 'Something went wrong! please try again later');
                          }
                        } catch(e)
                        {
                          ShowSnackBar(context, 'Something went wrong!');
                        }
                      }
                    },),
                    const SizedBox(height: 16,),
                    CustomOutLinedButton(title: 'create account', onPressed: () async
                    {
                      if(formKey.currentState!.validate())
                      {
                        try 
                        {
                          await FirebaseAuth.instance.createUserWithEmailAndPassword
                          (
                            email: emailController.text,
                            password: passController.text,
                          );
                          navigateRemoveUntil(context, const Layout());
                        } on FirebaseAuthException catch (e) 
                        {
                          if (e.code == 'weak-password') 
                          {ShowSnackBar(context, 'The password provided is too weak.');} 
                          else if (e.code == 'email-already-in-use') 
                          {ShowSnackBar(context,'The account already exists for that email.');}
                        } catch (e) {
                          ShowSnackBar(context, e.toString());
                        }
                      }
                    },)
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
