import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/blocs/patient_blocs/patient_navigation_bloc.dart';
import 'package:health_app/src/screens/widgets/patient_widgets/patient_bottom_navigation.dart';
import 'models/patient.dart';
import 'package:health_app/src/screens/patientScreens/history.dart';
import 'package:health_app/src/screens/patientScreens/home.dart';
import 'package:health_app/src/screens/patientScreens/profile.dart';
import 'package:health_app/src/screens/patientScreens/scan.dart';

class PatientNavigation extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<PatientNavigation> {
  final PatientNavigationBloc _patientNavigationBloc =
      BlocProvider.getBloc<PatientNavigationBloc>();
  int index = 0;

  List<Widget> page = [];
  @override
  void initState() {
    super.initState();
  }

  void changeIndex(int ind) {
    setState(() {
      index = ind;
    });
  }

  @override
  void dispose() {
    _patientNavigationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(Navigator.canPop(context));
      },
      child: StreamBuilder<Object>(
          stream: _patientNavigationBloc.streamUserData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Patient patient = snapshot.data;
              page.add(PatientHome());
              page.add(PatientHistory());
              page.add(Scan(patient));
              page.add(PatientProfile(patient));
              return Scaffold(
                body: IndexedStack(
                  children: page,
                  index: index,
                ),
                bottomNavigationBar: PatientBottomNavigation(
                    changeIndex: changeIndex, index: index),
              );
            }
            return Scaffold(
              body: IndexedStack(
                children: page,
                index: index,
              ),
              bottomNavigationBar: PatientBottomNavigation(
                  changeIndex: changeIndex, index: index),
            );
          }),
    );
  }
}
