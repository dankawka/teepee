import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teepee/components/default_scaffold.dart';
import 'package:teepee/components/entries_list.dart';
import 'package:teepee/components/otp_item.dart';
import 'package:teepee/core/repositories/entries_repository.dart';

import '../service_locator.dart';

class DashboardScreen extends StatelessWidget {
  final repo = getIt<EntriesRepository>();

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
                      child: EntriesList(),
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
                                Navigator.pushNamed(context, '/scanner');
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
