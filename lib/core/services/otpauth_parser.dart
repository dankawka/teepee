class OtpAuth {
  final String type;
  final String label;
  final String secret;
  final String issuer;
  final String algorithm;
  final String digits;
  final String period;
  final String otpauth;

  OtpAuth(
      {this.otpauth = '',
      this.type = 'totp',
      this.label,
      this.secret,
      this.issuer = '',
      this.algorithm = 'SHA1',
      this.digits = '6',
      this.period = '30'});
}

class OtpAuthParser {
  bool isValid(String otpauth) {
    try {
      Uri.parse(otpauth);
      return true;
    } catch (e) {
      return false;
    }
  }

  OtpAuth parse(String otpauth) {
    Uri _parsed;

    String type;
    String label;
    String secret;
    String issuer;
    String algorithm;
    String digits;
    String period;

    try {
      _parsed = Uri.parse(otpauth);

      type = _parsed.host;
      label = _parsed.pathSegments[0];
      _parsed.queryParameters.forEach((k, v) {
        switch (k) {
          case 'secret':
            {
              secret = v;
              break;
            }
          case 'issuer':
            {
              issuer = v;
              break;
            }
          case 'algorithm':
            {
              algorithm = v;
              break;
            }
          case 'period':
            {
              period = v;
              break;
            }
        }
      });

      return OtpAuth(
          otpauth: otpauth,
          algorithm: algorithm,
          digits: digits,
          issuer: issuer,
          label: label,
          period: period,
          secret: secret,
          type: type);
    } catch (e) {
      throw "Failed to parse qrcode";
    }
  }
}
