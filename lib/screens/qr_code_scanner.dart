import 'package:flutter/material.dart';
import 'package:teepee/components/default_scaffold.dart';
import 'package:teepee/services/qr_code_scanner.dart';

class QrCodeScannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: QRViewExample(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
