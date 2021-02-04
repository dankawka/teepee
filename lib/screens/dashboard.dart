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
                            color: Color.fromRGBO(255, 255, 255, 0.8),
                            fontFamily: 'Staatliches',
                            fontSize: 32)),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: ListView(
                        children: [
                          OtpItem(),
                          OtpItem(),
                          OtpItem(),
                          OtpItem(),
                          OtpItem(),
                          OtpItem(),
                          OtpItem()
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 100,
                        decoration: const BoxDecoration(
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(16),
                              right: Radius.circular(16),
                            ),
                            color: Color.fromRGBO(240, 240, 240, 1)),
                      ),
                      Positioned(
                        top: -32,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                      backgroundColor:
                                          Color.fromRGBO(255, 255, 255, 0),
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16))),
                                        height: 250,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Add entry",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Staatliches',
                                                  color: Colors.black),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0),
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.camera,
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 0.7),
                                                    size: 32,
                                                    semanticLabel:
                                                        'Text to announce in accessibility modes',
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      margin: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 0, 0, 0),
                                                      child: Text(
                                                          "Scan barcode",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontFamily:
                                                                  'Staatliches',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      0.9))),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              decoration: const BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      51, 44, 105, 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(16))),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0),
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.edit,
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 0.7),
                                                    size: 32,
                                                    semanticLabel:
                                                        'Text to announce in accessibility modes',
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      margin: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 0, 0, 0),
                                                      child: Text("Manually",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontFamily:
                                                                  'Staatliches',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      0.9))),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              decoration: const BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      51, 44, 105, 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(16))),
                                            )
                                          ],
                                        ),
                                      ));
                                });
                          },
                          child: Container(
                            height: 64,
                            width: 64,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 40,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.5),
                                      offset: new Offset(3, 3),
                                      blurRadius: 5)
                                ],
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromRGBO(255, 65, 108, 1),
                                      Color.fromRGBO(255, 75, 43, 1)
                                    ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                          ),
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
