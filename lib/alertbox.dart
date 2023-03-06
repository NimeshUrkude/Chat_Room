import 'package:flutter/material.dart';

class AlertBox extends StatefulWidget {

  final String showerror;

  const AlertBox({Key? key,required this.showerror}) : super(key: key);

  @override
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return (
        AlertDialog(
          elevation: 5.0,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Text("Try Again"),
          content: Text(widget.showerror),

          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: Text('Ok'),
            ),
          ],
        )
    );
  }
}





