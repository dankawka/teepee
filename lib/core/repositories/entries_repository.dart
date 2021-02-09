import 'dart:convert';

import 'package:teepee/core/infrastructure/database.dart';
import 'package:teepee/core/services/otpauth_parser.dart';
import 'package:uuid/uuid.dart';
import 'package:crypto/crypto.dart';
import '../../service_locator.dart';

final uuid = Uuid();

class EntriesRepository {
  Database _database;
  final otpAuthParserService = getIt<OtpAuthParser>();

  EntriesRepository() {
    _database = getIt<Database>();
  }

  bool insert(OtpAuth otpAuth) {
    final idAsBytes = utf8.encode(otpAuth.otpauth);
    final hashedId = sha256.convert(idAsBytes);
    final hashedIdAsString = hashedId.toString();

    if (_database.entriesBox.containsKey(hashedIdAsString)) {
      print("Already exists!");
      return false;
    }
    _database.entriesBox.put(hashedIdAsString, otpAuth.otpauth);
    return true;
  }

  List<OtpAuth> getAll() {
    final List<OtpAuth> list = [];
    final map = _database.entriesBox.toMap();
    map.forEach((k, v) {
      final el = otpAuthParserService.parse(v);
      el.setId(k);
      list.add(el);
    });
    return list;
  }
}
