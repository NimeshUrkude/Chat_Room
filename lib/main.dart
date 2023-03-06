import 'package:flutter/material.dart';
import "home.dart";
import "login.dart";
import "register.dart";
import "chat.dart";

import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(
      AppName()
  );
}

class AppName extends StatefulWidget {
  const AppName({Key? key}) : super(key: key);
  @override
  State<AppName> createState() => _AppNameState();
}


class _AppNameState extends State<AppName> {

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() => print("fb"));
  }

  Widget build(BuildContext context){
    return(
        MaterialApp(
          initialRoute: "/",
          routes: {
            "/":(context)=>HomePage(),
            "/Login":(context)=>LoginPage(),
            "/Register":(context)=>RegisterPage(),
            "/Chat":(context)=>ChatPage(),
          },
        )
    );
  }
}

