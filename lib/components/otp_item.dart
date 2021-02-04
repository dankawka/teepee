import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class OtpItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Fluttertoast.showToast(
            msg: "Copied!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromRGBO(38, 39, 54, 1),
            textColor: Colors.white,
            fontSize: 16);
        Clipboard.setData(new ClipboardData(text: "your text"));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  offset: new Offset(3, 3),
                  blurRadius: 5)
            ],
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(101, 78, 163, 1),
                  Color.fromRGBO(234, 175, 200, 1),
                ])),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Github",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                      fontFamily: 'Staatliches',
                      fontSize: 24),
                )
              ],
            ),
            Row(
              children: [
                Text("872 874",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Staatliches',
                        fontSize: 42))
              ],
            )
          ],
        ),
      ),
    );
  }
}
