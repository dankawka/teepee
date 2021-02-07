import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../../service_locator.dart';

class Database {
  Box<dynamic> entriesBox;
  Box<dynamic> appSettingsBox;

  Database() {
    _initDatabases().then((_) {
      getIt.signalReady(this);
    });
  }

  Future _initDatabases() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    var containsEncryptionKey = await secureStorage.containsKey(key: 'key');
    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }

    final encryptionKey =
        base64Url.decode(await secureStorage.read(key: 'key'));
    print('Encryption key: $encryptionKey');

    entriesBox = await Hive.openBox('entries',
        encryptionCipher: HiveAesCipher(encryptionKey));
    appSettingsBox = await Hive.openBox('app_settings');
  }
}
