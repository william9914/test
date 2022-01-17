import 'package:flutter/material.dart';
import 'package:test_app/screens/main_screen.dart';
import 'package:test_app/util/const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      home: MainScreen(),
    );
  }
}
