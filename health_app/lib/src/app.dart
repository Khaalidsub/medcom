import 'package:flutter/material.dart';
import 'package:health_app/src/screens/hospitalScreens/hospRegistration.dart';
import 'package:health_app/src/screens/patientScreens/profile.dart';
import 'package:health_app/src/screens/patientScreens/history.dart';
import 'package:health_app/src/screens/patientScreens/home.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int index = 0;

  void changeIndex(int ind) {
    setState(() {
      index = ind;
    });
  }

  Widget changePage() {
    if (index == 0) {
      return PatientHome(changeIndex: changeIndex, index: index);
    } else if (index == 2) {
      return PatientHistory(changeIndex: changeIndex, index: index);
    } else if (index == 4) {
      return PatientProfile(index: index, changeIndex: changeIndex);
    } else {
      return PatientHome(changeIndex: changeIndex, index: index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: changePage(),
    );
  }
}
