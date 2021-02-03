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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(142, 45, 226, 1),
                  Color.fromRGBO(74, 0, 224, 1)
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
