import 'package:mobx/mobx.dart';
import 'package:teepee/core/services/otpauth_parser.dart';

part 'entries.g.dart';

class EntriesStore = _EntriesStore with _$EntriesStore;

abstract class _EntriesStore with Store {
  @observable
  List<OtpAuth> entries = [];

  @action
  void add(OtpAuth entry) {
    entries.add(entry);
  }
}
