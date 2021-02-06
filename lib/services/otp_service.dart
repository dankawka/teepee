import 'package:otp/otp.dart';

class OtpService {
  String generateCode(String secret, int now) {
    return OTP.generateTOTPCodeString(secret, now,
        algorithm: Algorithm.SHA1, interval: 30, isGoogle: true, length: 6);
  }
}
