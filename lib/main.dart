import 'package:chat_app/View/Auth/login_page.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async 
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp
  (
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData
      (
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.dark),
      ),
      theme: ThemeData
      (
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.light),
        useMaterial3: true,
      ),
      home: StreamBuilder
      (
        stream: FirebaseAuth.instance.userChanges(), 
        builder: ((context, snapshot) 
        {
          if(snapshot.hasData)
          {return const Layout();}
          else
          {return const LoginPage();}
        })
      )
    );
  }
}
