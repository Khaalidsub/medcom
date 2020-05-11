import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/hospital_widgets/hospital_bottom_navigation.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/screens/hospitalScreens/add_screen.dart';
import 'package:health_app/src/screens/hospitalScreens/history.dart';
import 'package:health_app/src/screens/hospitalScreens/home.dart';
import 'package:health_app/src/screens/hospitalScreens/profile.dart';
import 'package:health_app/src/screens/hospitalScreens/hospital_scan.dart';

class HospitalNavigation extends StatefulWidget {
  final Hospital user;
  HospitalNavigation(this.user);
  @override
  _HospitalMainState createState() => _HospitalMainState();
}

class _HospitalMainState extends State<HospitalNavigation> {
  int index = 0;
  void changeIndex(int val) {
    setState(() {
      this.index = val;
    });
  }

  List<Widget> page = [];
  @override
  void initState() {
    page.add(HospitalHome());
    page.add(AddScreen(widget.user));
    page.add(HospitalHistory());
    page.add(ScanHospital());
    page.add(HospitalProfile(widget.user));
    super.initState();
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
            BottomNavigation(changeIndex: changeIndex, index: index),
      ),
    );
  }
}
