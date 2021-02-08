import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teepee/core/stores/entries.dart';

import '../service_locator.dart';
import 'otp_item.dart';

class EntriesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EntriesListState();
  }
}

class _EntriesListState extends State<EntriesList> {
  final _entriesStore = getIt.get<EntriesStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => ListView.builder(
              itemCount: _entriesStore.entries.length,
              itemBuilder: (context, index) {
                return OtpItem(
                  otpauth: _entriesStore.entries[index],
                );
              },
            ));
  }
}
