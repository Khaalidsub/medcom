import 'package:flutter/material.dart';

import 'package:health_app/src/screens/widgets/patient_widgets/patient_bottom_navigation.dart';
import 'package:health_app/src/utils/patient_routing.dart';
import 'models/patient.dart';

class PatientNavigation extends StatefulWidget {
  Patient user;
  PatientNavigation(this.user);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<PatientNavigation> {
  int index = 0;

  void changeIndex(int ind) {
    setState(() {
      index = ind;
    });
    // print(name);
    if (index == 0) {
      navigatorKey.currentState.pushReplacementNamed('/home');
    } else if (index == 1) {
      navigatorKey.currentState.pushReplacementNamed('/history');
    } else if (index == 3) {
      navigatorKey.currentState
          .pushReplacementNamed('/profile', arguments: widget.user);
    } else if (index == 2) {
      navigatorKey.currentState
          .pushReplacementNamed('/scan', arguments: widget.user);
    } else {
      navigatorKey.currentState.pushReplacementNamed('/home');
    }
  }

//!stores the current state/page route : e.g  home etc...
  final navigatorKey = GlobalKey<NavigatorState>();

  // void changePage() {}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(Navigator.canPop(context));
      },
      child: Scaffold(
        body: Navigator(
          key: navigatorKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            PatientRoute router = PatientRoute();
            return router.routing(settings, context);
          },
        ),
        bottomNavigationBar:
            PatientBottomNavigation(changeIndex: changeIndex, index: index),
      ),
    );
  }
}
