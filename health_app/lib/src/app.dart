import 'package:flutter/material.dart';
import 'package:health_app/src/screens/hospitalScreens/home.dart';
import 'package:health_app/src/screens/patientScreens/profile.dart';
import 'package:health_app/src/screens/patientScreens/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: PatientProfile(),
    );
  }
}
