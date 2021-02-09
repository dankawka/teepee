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

  @action
  void addAll(List<OtpAuth> newEntries) {
    if (newEntries.length == 0) {
      return;
    }

    final withoutDuplicates = newEntries.where((item) {
      final itemId = item.id;
      final exists = entries.any((existingItem) => existingItem.id == itemId);
      return !exists;
    });

    entries.addAll(withoutDuplicates.toList());
  }
}
