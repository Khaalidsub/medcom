import 'package:flutter/material.dart';
import 'package:health_app/src/screens/home.dart';
import 'package:health_app/src/screens/hospRegistration.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: HospRegistration(),
    );
  }
}
