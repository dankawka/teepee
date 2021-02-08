// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entries.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EntriesStore on _EntriesStore, Store {
  final _$entriesAtom = Atom(name: '_EntriesStore.entries');

  @override
  List<OtpAuth> get entries {
    _$entriesAtom.reportRead();
    return super.entries;
  }

  @override
  set entries(List<OtpAuth> value) {
    _$entriesAtom.reportWrite(value, super.entries, () {
      super.entries = value;
    });
  }

  final _$_EntriesStoreActionController =
      ActionController(name: '_EntriesStore');

  @override
  void add(OtpAuth entry) {
    final _$actionInfo =
        _$_EntriesStoreActionController.startAction(name: '_EntriesStore.add');
    try {
      return super.add(entry);
    } finally {
      _$_EntriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
entries: ${entries}
    ''';
  }
}
