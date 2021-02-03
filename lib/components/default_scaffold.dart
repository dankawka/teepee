import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget child;

  const DefaultScaffold({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: child);
  }
}
