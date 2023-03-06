import 'package:flutter/material.dart';
import "logregbtn.dart";
import "const.dart";
import "alertbox.dart";
import "package:firebase_auth/firebase_auth.dart";

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _auth = FirebaseAuth.instance;

  String email="";
  String password="";
  String referalcode="";

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
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
                      onChanged: (value) {
                        email=value;
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
                        password=value;
                      },
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      decoration: kDecoration.copyWith(hintText: "Enter your Password"),
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.fromLTRB(20,5,20,5),
                    child:TextField(
                      onChanged: (value) {
                        referalcode=value;
                      },
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      decoration: kDecoration.copyWith(hintText: "Enter your Refernal Code"),
                    ),
                  ),
                  LogRegBtn(text:"Register",nxtchild:() async {
                    try{
                      if(referalcode=="error404"){
                        final newuser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                        if(newuser != null){
                          Navigator.pushNamed(context, "/Chat");
                        }
                      }
                    }
                    catch(e){
                      showDialog(context: context, builder: (BuildContext)=>AlertBox(showerror:"Please restart your app as registration is unable to compleate"));
                    }
                  }),
                ],
              )
          ),
        )
    );
  }
}





