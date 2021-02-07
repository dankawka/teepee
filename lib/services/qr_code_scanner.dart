import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var isFlashOn = false;
  Barcode result;
  QRViewController controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    final scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    formatsAllowed: [BarcodeFormat.qrcode],
                    overlay: QrScannerOverlayShape(
                      borderColor: Colors.red,
                      borderRadius: 10,
                      borderLength: 30,
                      borderWidth: 10,
                    )),
                GestureDetector(
                  onTap: () async {
                    await controller.toggleFlash();
                    setState(() {
                      isFlashOn = !isFlashOn;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 32),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFlashOn ? Icons.flash_on : Icons.flash_off,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                )
              ],
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Center(
          //     child: (result != null)
          //         ? Text(
          //             'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
          //         : Text('Scan a code'),
          //   ),
          // )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
}

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QRViewExampleState();
  }
}
