import 'package:flutter/material.dart';
import 'package:teepee/components/default_scaffold.dart';
import 'package:teepee/components/otp_item.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Text("Codes",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Staatliches',
                            fontSize: 28)),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: ListView(
                        children: [
                          OtpItem(),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 75,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(41, 50, 65, 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                print(":das");
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(Icons.camera)),
                            ),
                            InkWell(
                              child: Container(child: Icon(Icons.add)),
                            ),
                            InkWell(
                                child: Container(child: Icon(Icons.settings)))
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
