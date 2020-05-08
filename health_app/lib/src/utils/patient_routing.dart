import 'package:flutter/material.dart';
import 'package:health_app/src/screens/patientScreens/history.dart';
import 'package:health_app/src/screens/patientScreens/home.dart';
import 'package:health_app/src/screens/patientScreens/profile.dart';
import 'package:health_app/src/screens/patientScreens/scan.dart';
import 'package:health_app/src/screens/patientScreens/settings.dart';

class PatientRoute {
  MaterialPageRoute<dynamic> routing(
      RouteSettings settings, BuildContext context) {
    WidgetBuilder builder;
    switch (settings.name) {
      case '/':
        builder = (BuildContext context) => PatientHome();
        break;
      case '/home':
        builder = (BuildContext context) => PatientHome();
        break;
      case '/history':
        builder = (BuildContext context) => PatientHistory();
        break;
      case '/profile':
        builder = (BuildContext context) => PatientProfile(settings.arguments);
        break;
      case '/settings':
        builder = (BuildContext context) => PatientSettings();
        break;
      case '/scan':
        builder = (BuildContext context) =>
            Scan(settings.arguments); //send the patient data
        break;
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
