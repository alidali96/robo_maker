import 'package:clementoni/constants.dart';
import 'package:clementoni/core/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as app;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await app.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
