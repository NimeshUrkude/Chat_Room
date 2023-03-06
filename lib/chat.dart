import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "chatbbl.dart";
import "alertbox.dart";

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  final _firestore = FirebaseFirestore.instance;
  String message="";

  final TextEditingController _controller = TextEditingController();

  @override
  void initState(){
    super.initState();
    getCurrentUser();

    tt();
  }

  void tt()async{
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('messages').orderBy("time", descending: false).snapshots();

    await for (QuerySnapshot snapshot in _usersStream) {
      for (int i = 0; i < snapshot.docs.length; i++) {
        print(snapshot.docs[i].data());
      }
    }
  }
  void getCurrentUser() async {
    try{
      final username = await _auth.currentUser;
      if(username != null){
        loggedInUser = username;
        print(loggedInUser.email);
      }
    }
    catch(e){
      showDialog(context: context, builder: (BuildContext)=>AlertBox(showerror:"Please restart your app as login is unable to compleate"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return (
        Scaffold(
          appBar: AppBar(
            leading: null,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async{
                    await _auth.signOut();
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
            ],
            title: Text('Chat Room'),
            backgroundColor: Color(0xFF9f53fd),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection('messages').orderBy("time",descending: true).snapshots(),
                    builder: (context, snapshot) {
                      List<Widget> showWidgets = [];
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Color(0xFF9f53fd),
                          ),
                        );
                      }
                      final gotdata = snapshot.data!.docs;
                      for(int i=0;i<gotdata.length;i++) {
                        final mtext = gotdata[i].get("text");
                        final memail = gotdata[i].get("email");
                        final mnum = (memail==loggedInUser.email)?1:0;

                        final temptxtWidget = ChatBbl(memail: memail, mtext: mtext,mnum:mnum);
                        showWidgets.add(temptxtWidget);
                      }

                      return Expanded(
                        child: ListView(
                          reverse: true,
                          children: showWidgets,
                        ),
                      );
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border(top: BorderSide(color: Color(0xFF9f53fd), width: 2.0),),),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            onChanged: (value) {
                              message = value;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                              hintText: 'Type your message here...',
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if(message.isNotEmpty){
                              _firestore.collection("messages").add({
                                "email":loggedInUser.email,
                                "text":message,
                                "time":(DateTime.now().millisecondsSinceEpoch),
                              });
                              setState(() {
                                message="";
                                _controller.clear();
                              });
                            }
                          },
                          child: Text(
                            'Send',
                            style: TextStyle(
                              color: Color(0xFF9f53fd),
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ),
        )
    );
  }
}





