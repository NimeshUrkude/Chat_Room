import 'package:Chat_room/alertbox.dart';
import 'package:flutter/material.dart';
import "logregbtn.dart";
import "const.dart";

import "package:firebase_auth/firebase_auth.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _auth = FirebaseAuth.instance;

  String email="";
  String password="";

  @override
  Widget build(BuildContext context) {
    return (
        Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: Hero(
                      tag:"logo",
                      child: Container(
                        child: Image.asset('image/logo.png'),
                          constraints: BoxConstraints(
                            maxHeight: 150.0,
                            minHeight: 5.0,
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      decoration: kDecoration.copyWith(hintText: "Enter your Email"),
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.fromLTRB(20,5,20,5),
                    child:TextField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      decoration: kDecoration.copyWith(hintText: "Enter your Password"),
                    ),
                  ),
                  LogRegBtn(text:"Login",nxtchild:()async{
                    try{
                      final oldUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                      if(oldUser != null){
                        Navigator.pushNamed(context, "/Chat");
                      }
                    }
                    catch(e){
                      showDialog(context: context, builder: (BuildContext)=>AlertBox(showerror:"Please Check your Email and Password Again"));
                    }
                  }),
                ],
              )
          ),
        )
    );
  }
}





