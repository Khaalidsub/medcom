import 'package:flutter/material.dart';

import 'package:health_app/src/screens/login.dart';
import 'package:health_app/src/screens/splash_screen.dart';
import 'package:health_app/src/screens/welcoming_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: SplashScreen(),
    );
  }
}
