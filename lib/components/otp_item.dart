import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:circular_countdown/circular_countdown.dart';
import 'package:teepee/services/otp_service.dart';

import '../service_locator.dart';

class _OtpItemState extends State<OtpItem> {
  Timer _timer;
  int _timeLeft = 0;
  String _code = "XXX";

  final otpService = getIt<OtpService>();

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timeLeft == 0) {
          regenerateCode();
        } else {
          setState(() {
            _timeLeft--;
          });
        }
      },
    );
  }

  void regenerateCode() {
    final now = DateTime.now();
    final nowInMs = now.millisecondsSinceEpoch;
    final nowInS = (nowInMs / 1000).round();
    final code = otpService.generateCode("JBSWY3DPEHPK3PXP", nowInMs);
    final time_remaining = 30 - nowInS % 30;

    setState(() {
      _timeLeft = time_remaining;
      _code = code;
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    regenerateCode();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _OtpItem(
      timeLeft: _timeLeft,
      code: _code,
    );
  }
}

class OtpItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OtpItemState();
  }
}

class _OtpItem extends StatelessWidget {
  final int timeLeft;
  final String code;

  const _OtpItem({Key key, this.timeLeft, this.code}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 5, 16, 5),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: BoxDecoration(
          boxShadow: [
            new BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                offset: new Offset(3, 3),
                blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(16),
          color: Color.fromRGBO(61, 90, 128, 1)),
      child: InkWell(
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Github",
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.7),
                          fontFamily: 'Staatliches',
                          fontSize: 24),
                    ),
                    Text(code,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Staatliches',
                            fontSize: 42))
                  ],
                ),
                CircularCountdown(
                  diameter: 52,
                  countdownTotal: 30,
                  countdownRemaining: timeLeft,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
