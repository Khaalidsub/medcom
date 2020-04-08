import 'package:flutter/material.dart';

import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/patient_bottom_navigation.dart';
import 'package:health_app/src/utils/patient_routing.dart';

//HI Sheref, En Sing here
//You mean the code suggest?
//yes, I think got 
//but this is live share, shall we try cloudberry? Or this is good?
//ok but i'm not sure cloudberry for what haha

//i think it will share the whole pc screen, not only the visual code
//okk i'll send u my code

//ok~

//but i'm not sure why suggestion can't because i try to host him then he can't 
//but when he try to host me then we both can

// u need to right click on the shared screen then request for full access or something like this

//can you still access to your own pc?

//ya now we both accessing 
//You think which one is better? i 

//think live sharing we can edit together at the same time? this one //
// is like one person at t

// ya so messey haha live share better
//yes, b

 //btw if we can use audio call on liveshare i think would better to communicate
 //Or calling through telegram also can~

//  can can
// u try to host me for live share

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
    } else if (index == 1) {
      navigatorKey.currentState.pushReplacementNamed('/history');
    } else if (index == 3) {
      navigatorKey.currentState.pushReplacementNamed('/profile');
    } else if (index == 2) {
      navigatorKey.currentState.pushReplacementNamed('/scan');
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
      onWillPop: () {return Future.value(false);},
      child: Scaffold(
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
            PatientBottomNavigation(changeIndex: changeIndex, index: index),
      ),
    );
  }
}
