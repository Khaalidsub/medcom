import 'package:flutter/material.dart';
import 'package:health_app/src/screens/hospitalScreens/add_appointment.dart';
import 'package:health_app/src/screens/hospitalScreens/add_medicine.dart';
import 'package:health_app/src/screens/hospitalScreens/add_screen.dart';
import 'package:health_app/src/screens/hospitalScreens/edit_profile.dart';

import 'package:health_app/src/screens/hospitalScreens/history.dart';
import 'package:health_app/src/screens/hospitalScreens/home.dart';
import 'package:health_app/src/screens/hospitalScreens/patient_appointment_list.dart';
import 'package:health_app/src/screens/hospitalScreens/patient_list.dart';
import 'package:health_app/src/screens/hospitalScreens/profile.dart';
import 'package:health_app/src/screens/hospitalScreens/hospital_scan.dart';
import 'package:health_app/src/screens/hospitalScreens/update_appointment.dart';
import 'package:health_app/src/screens/hospitalScreens/settings.dart';

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
      case '/patient_appointment_list':
        builder = (BuildContext context) => PatientDetails(settings.arguments);
        break;
      case '/add_appointment':
        builder = (BuildContext context) => AddAppointment(settings.arguments);
        break;
      case '/add_medicine':
        builder = (BuildContext context) => AddMedicine();
        break;
      case '/update_appointment':
        builder =
            (BuildContext context) => UpdateAppointment(settings.arguments);
        break;
      case '/scanHospital':
        builder = (BuildContext context) => ScanHospital();

        break;
      case '/patientList':
        builder = (BuildContext context) =>
            PatientList(settings.arguments); //Expecting list of object Patient
        break;
      case '/profile':
        builder = (BuildContext context) => HospitalProfile(settings.arguments);
        break;
      case '/edit_profile':
        builder = (BuildContext context) => EditProfile(settings.arguments);
        break;
      case '/scanHospital':
        builder = (BuildContext context) => ScanHospital();

        break;
      case '/settings':
        builder =
            (BuildContext context) => HospitalSettings(settings.arguments);
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
