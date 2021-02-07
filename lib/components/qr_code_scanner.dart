import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:teepee/core/repositories/entries_repository.dart';
import 'package:teepee/core/services/otpauth_parser.dart';

import '../service_locator.dart';

class _QRViewState extends State<QRViewComponent> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var isFlashOn = false;
  Barcode result;
  QRViewController controller;
  final entriesRepository = getIt<EntriesRepository>();
  final otpAuthParserService = getIt<OtpAuthParser>();

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
        if (otpAuthParserService.isValid(result.toString())) {
          final parsed = otpAuthParserService.parse(result.toString());
          entriesRepository.insert(parsed);
        }
      });
    });
  }
}

class QRViewComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QRViewState();
  }
}
