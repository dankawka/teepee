import 'dart:convert';

import 'package:teepee/core/infrastructure/database.dart';
import 'package:teepee/core/services/otpauth_parser.dart';
import 'package:uuid/uuid.dart';
import 'package:crypto/crypto.dart';
import '../../service_locator.dart';

final uuid = Uuid();

class EntriesRepository {
  Database _database;

  EntriesRepository() {
    _database = getIt<Database>();
  }

  bool insert(OtpAuth otpAuth) {
    final bytes = utf8.encode(otpAuth.otpauth);
    final digest = sha256.convert(bytes);
    final asString = digest.toString();

    if (_database.entriesBox.containsKey(asString)) {
      print("Already exists!");
      return false;
    }

    final val = otpAuth.otpauth;
    print("Inserting $val");
    _database.entriesBox.put(asString, val);
    print("Added new!");
    return true;
  }

  getAll() {
    return _database.entriesBox.toMap();
  }
}
