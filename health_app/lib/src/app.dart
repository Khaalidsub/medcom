import 'package:flutter/material.dart';
import 'package:health_app/src/screens/hospitalScreens/hospRegistration.dart';

import 'package:health_app/src/screens/login.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: LoginForm(),
    );
  }
}
