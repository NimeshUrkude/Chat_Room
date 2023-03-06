import 'package:flutter/material.dart';

class LogRegBtn extends StatefulWidget {
  final String text;
  final VoidCallback? nxtchild;
  const LogRegBtn({Key? key,required this.text,required this.nxtchild}) : super(key: key);

  @override
  State<LogRegBtn> createState() => _LogRegBtnState();
}

class _LogRegBtnState extends State<LogRegBtn> {
  @override
  Widget build(BuildContext context) {
    return (
      Container(
        margin: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        padding: EdgeInsets.all(7.0),
        child: GestureDetector(
          onTap: widget.nxtchild,
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: "TiltNeon",
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0xFF9f53fd),
        ),
      )
    );
  }
}





