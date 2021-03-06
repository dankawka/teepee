import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:circular_countdown/circular_countdown.dart';
import 'package:teepee/core/services/otp_service.dart';
import 'package:teepee/core/services/otpauth_parser.dart';

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
    final code = otpService.generateCode(widget.otpauth.secret, nowInMs);
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
      label: widget.otpauth.label,
      timeLeft: _timeLeft,
      code: _code,
    );
  }
}

class OtpItem extends StatefulWidget {
  final OtpAuth otpauth;

  const OtpItem({Key key, this.otpauth}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _OtpItemState();
  }
}

class _OtpItem extends StatelessWidget {
  final int timeLeft;
  final String code;
  final String label;

  const _OtpItem({Key key, this.timeLeft, this.code, this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 5, 16, 5),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromRGBO(20, 20, 20, 1)),
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
                      label,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.7),
                          fontFamily: 'OpenSans',
                          fontSize: 18),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: CircularCountdown(
                            diameter: 26,
                            countdownTotal: 30,
                            countdownRemaining: timeLeft,
                          ),
                        ),
                        Text(code.substring(0, 3) + " " + code.substring(3, 6),
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'OpenSans',
                                fontSize: 32))
                      ],
                    )
                  ],
                ),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                        value: "hello",
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem(
                        value: "hello",
                        child: Text('Remove'),
                      ),
                    ];
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
