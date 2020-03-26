import 'package:flutter/material.dart';
import 'package:health_app/src/screens/patientScreens/history.dart';
import 'package:health_app/src/screens/patientScreens/home.dart';
import 'package:health_app/src/screens/patientScreens/profile.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/bottom_navigation.dart';

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
  }

  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
      ),
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/home':
              builder = (BuildContext context) => PatientHome(
                    index: index,
                    changeIndex: changeIndex,
                  );

              break;
            case '/history':
              builder = (BuildContext context) => PatientHistory(
                    changeIndex: changeIndex,
                    index: index,
                  );
              break;
            case '/profile':
              builder = (BuildContext context) => PatientProfile(
                    changeIndex: changeIndex,
                    index: index,
                  );
              break;

            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(
            builder: builder,
            settings: settings,
          );
        },
      ),
      bottomNavigationBar:
          BottomNavigation(changeIndex: changeIndex, index: index),
    );
  }
}
