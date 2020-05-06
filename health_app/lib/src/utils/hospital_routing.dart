import 'package:flutter/material.dart';
import 'package:health_app/src/screens/hospitalScreens/addScreen.dart';
import 'package:health_app/src/screens/hospitalScreens/history.dart';
import 'package:health_app/src/screens/hospitalScreens/home.dart';
import 'package:health_app/src/screens/hospitalScreens/patient_list.dart';
import 'package:health_app/src/screens/hospitalScreens/profile.dart';

class HospitalRouting {
  MaterialPageRoute<dynamic> routing(
      RouteSettings settings, BuildContext context) {
    //build the page routing using the settings sent
    //we need a widget builder to build this new page
    WidgetBuilder builder;

    switch (settings.name) {
      case '/':
        builder = (BuildContext context) => HospitalHome();
        break;
      case '/home':
        builder = (BuildContext context) => HospitalHome();

        break;
      case '/add':
        builder = (BuildContext context) => AddScreen();

        break;
      case '/history':
        
        builder = (BuildContext context) => HospitalHistory();

        break;
      case '/patientList':
        builder = (BuildContext context) =>
            PatientList(settings.arguments); //Expecting list of object Patient
        break;
      case '/profile':
        builder = (BuildContext context) => HospitalProfile();
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
