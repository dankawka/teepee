import 'package:flutter/material.dart';
import 'package:teepee/screens/dashboard.dart';
import 'package:teepee/screens/qr_code_scanner.dart';
import 'package:teepee/service_locator.dart';

import 'core/repositories/entries_repository.dart';
import 'core/stores/entries.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(MyApp());
}

void hydrateStores() {
  final entriesStore = getIt.get<EntriesStore>();
  final entriesRepository = getIt.get<EntriesRepository>();

  final allEntries = entriesRepository.getAll();
  entriesStore.addAll(allEntries);
}

Future<void> appInit() async {
  await getIt.allReady();
  hydrateStores();
  return true;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: appInit(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 1),
              brightness: Brightness.dark,
              primaryColor: Colors.lightBlue[800],
              accentColor: Colors.black87,
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
              // This makes the visual density adapt to the platform that you run
              // the app on. For desktop platforms, the controls will be smaller and
              // closer together (more dense) than on mobile platforms.
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => DashboardScreen(),
              '/scanner': (context) => QrCodeScannerScreen(),
            },
          );
        }

        return Center(
          child: Text(
            'Loading',
            textDirection: TextDirection.ltr,
          ),
        );
      },
    );
  }
}
