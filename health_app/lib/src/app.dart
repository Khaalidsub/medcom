import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:health_app/src/screens/patientScreens/profile.dart';
import 'package:health_app/src/screens/patientScreens/scan.dart';
import 'package:health_app/src/screens/hospitalScreens/patientDetails.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: PatientDetails(),
    );
  }
}
