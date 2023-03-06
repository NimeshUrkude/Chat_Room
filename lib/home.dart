import 'package:flutter/material.dart';
import "logregbtn.dart";
import "alertbox.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                          maxHeight: 300.0,
                          minHeight: 5.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 100.0,),
                  LogRegBtn(text:"Login",nxtchild:(){Navigator.pushNamed(context, "/Login");}),
                  LogRegBtn(text:"Register",nxtchild:(){Navigator.pushNamed(context, "/Register");}),
                ],
              )
          ),
        )
    );
  }
}





