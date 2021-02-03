import 'package:flutter/material.dart';
import 'package:teepee/components/default_scaffold.dart';
import 'package:teepee/components/otp_item.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text("Codes",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.8),
                            fontFamily: 'Staatliches',
                            fontSize: 32)),
                  ),
                  OtpItem()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
