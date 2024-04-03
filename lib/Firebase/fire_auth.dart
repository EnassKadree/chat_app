import 'package:chat_app/Model/user_model.dart';
import 'package:chat_app/View/Auth/setup_profile.dart';
import 'package:chat_app/layout.dart';
import 'package:chat_app/utils/helpers/navigator.dart';
import 'package:chat_app/utils/helpers/show_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireAuth
{
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;


  createUser() async
  {
    User user = auth.currentUser!;

    ChatUser chatUser = ChatUser
    (
      id: user.uid, 
      name: user.displayName ?? '', 
      email: user.email ?? '', 
      about: 'Hello, I\'m using chat', 
      image: '', 
      createdAt: DateTime.now().toString(), 
      lastActive:DateTime.now().toString(), 
      pushToken: '', 
      online: false
    );
    //by using .doc(-...-) I'm giving the field of each user the same id that he have in the FirebseAuth
    fireStore.collection('users').doc(user.uid).set(chatUser.toJson());
  }

  loginUser({required email, required password, required context}) async
  {
    try 
    {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password
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

  registerUser({required email, required password, required context}) async
  {
    try 
    {
      await FirebaseAuth.instance.createUserWithEmailAndPassword
      (
        email: email,
        password: password,
      );
      navigateRemoveUntil(context, const SetupProfile());
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
}