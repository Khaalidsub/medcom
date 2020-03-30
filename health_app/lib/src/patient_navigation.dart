import 'package:flutter/material.dart';

import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/bottom_navigation.dart';
import 'package:health_app/src/utils/patient_routing.dart';

class PatientNavigation extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<PatientNavigation> {
  int index = 0;

  void changeIndex(int ind) {
    setState(() {
      index = ind;
    });

    if (index == 0) {
      navigatorKey.currentState.pushReplacementNamed('/home');
    } else if (index == 2) {
      navigatorKey.currentState.pushReplacementNamed('/history');
    } else if (index == 4) {
      navigatorKey.currentState.pushReplacementNamed('/profile');
    } else {
      navigatorKey.currentState.pushReplacementNamed('/home');
    }
  }

//!stores the current state/page route : e.g  home etc...
  final navigatorKey = GlobalKey<NavigatorState>();

  // void changePage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
      ),
      body: Navigator(
        key: navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
        PatientRoute router = PatientRoute();
          return router.routing(settings, context);
        },
      ),
      bottomNavigationBar:
          BottomNavigation(changeIndex: changeIndex, index: index),
    );
  }
}
