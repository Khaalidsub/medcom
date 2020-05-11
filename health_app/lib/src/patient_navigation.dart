import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/patient_widgets/patient_bottom_navigation.dart';
import 'models/patient.dart';
import 'package:health_app/src/screens/patientScreens/history.dart';
import 'package:health_app/src/screens/patientScreens/home.dart';
import 'package:health_app/src/screens/patientScreens/profile.dart';
import 'package:health_app/src/screens/patientScreens/scan.dart';

class PatientNavigation extends StatefulWidget {
  final Patient user;
  PatientNavigation(this.user);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<PatientNavigation> {
  int index = 0;

  List<Widget> page = [];
  @override
  void initState() {
    page.add(PatientHome());
    page.add(PatientHistory());
    page.add(Scan(widget.user));
    page.add(PatientProfile(widget.user));
    super.initState();
  }

  void changeIndex(int ind) {
    setState(() {
      index = ind;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(Navigator.canPop(context));
      },
      child: Scaffold(
        body: IndexedStack(
          children: page,
          index: index,
        ),
        bottomNavigationBar:
            PatientBottomNavigation(changeIndex: changeIndex, index: index),
      ),
    );
  }
}
