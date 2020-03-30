import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/bottom_navigation.dart';
import 'package:health_app/src/utils/hospital_routing.dart';

class HospitalNavigation extends StatefulWidget {
  @override
  _HospitalMainState createState() => _HospitalMainState();
}

class _HospitalMainState extends State<HospitalNavigation> {
  int index = 0;
  //to manipulate the navigator. without it I can use Navigator.of(Context)
  //basically we need the context (a thing) to push on, which normally is the
  //current top element in the Navigator widget
  final navigatorKey = GlobalKey<NavigatorState>();
//changing the index based on user movement along the bottom Navigation.
//using this index we will change the route names using switch.
  void changeIndex(int val) {
    setState(() {
      this.index = val;
    });
    //ignore the names of the route for now.
    switch (index) {
      case 0:
        navigatorKey.currentState.pushReplacementNamed('/home');
        break;
      case 2:
        navigatorKey.currentState.pushReplacementNamed('/patientList');
        break;
      case 4:
        navigatorKey.currentState.pushReplacementNamed('/home');
        break;
      default:
    }
  }

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
          //creating instance of hospital routing to return the materialPage route.
          HospitalRouting hpRouter = HospitalRouting();
          return hpRouter.routing(settings, context);
        },
      ),
      bottomNavigationBar:
          BottomNavigation(changeIndex: changeIndex, index: index),
    );
  }
}
