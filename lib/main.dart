import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guaiaca',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}
