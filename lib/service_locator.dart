import 'package:get_it/get_it.dart';
import 'package:teepee/core/repositories/entries_repository.dart';
import 'package:teepee/core/services/otpauth_parser.dart';

import 'core/infrastructure/database.dart';
import 'core/services/otp_service.dart';
import 'core/stores/entries.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<OtpService>(OtpService());
  getIt.registerSingleton<OtpAuthParser>(OtpAuthParser());

  getIt.registerSingleton<EntriesStore>(EntriesStore());

  getIt.registerSingleton<Database>(Database(), signalsReady: true);
  getIt.registerSingletonWithDependencies<EntriesRepository>(
      () => EntriesRepository(),
      dependsOn: [Database]);
}
