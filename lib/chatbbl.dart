import 'package:flutter/material.dart';

class ChatBbl extends StatefulWidget {

  final String memail;
  final String mtext;
  final int mnum;

  const ChatBbl({Key? key,required this.memail,required this.mtext,required this.mnum}) : super(key: key);
  @override
  State<ChatBbl> createState() => _ChatBblState();
}

class _ChatBblState extends State<ChatBbl> {
  @override
  Widget build(BuildContext context) {
    return (
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: (widget.mnum==1)?CrossAxisAlignment.end:CrossAxisAlignment.start,
            children: [
              Text(
                widget.memail,
                style: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Padding(
                child: Material(
                  elevation: 5.0,
                  borderRadius: (widget.mnum==1)?(BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )):(BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )),
                  color:(widget.mnum==1)?Color(0xFF9f53fd):Colors.white,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Text(
                      widget.mtext,
                      style: TextStyle(
                        color:(widget.mnum==1)?Colors.white:Colors.black,
                      ),
                    ),
                  ),
                ),
                padding:(widget.mnum==1)?(EdgeInsets.fromLTRB(30, 0, 0, 0)):(EdgeInsets.fromLTRB(0, 0, 30, 0)),
              )
            ],
          ),
        )
    );
  }
}





