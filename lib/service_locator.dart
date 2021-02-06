import 'package:get_it/get_it.dart';
import 'package:teepee/services/otp_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<OtpService>(OtpService());
}
