import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/screens/hospitalScreens/hospital_registration.dart';
import 'package:health_app/src/screens/login.dart';
import 'package:health_app/src/screens/patientScreens/patient_registration.dart';
import 'package:health_app/src/screens/welcoming_screen.dart';
import 'package:health_app/src/screens/patientScreens/history.dart';
import 'package:health_app/src/screens/patientScreens/home.dart';
import 'package:health_app/src/screens/patientScreens/profile.dart';
import 'package:health_app/src/screens/patientScreens/edit_profile.dart';
import 'package:health_app/src/screens/patientScreens/scan.dart';
import 'package:health_app/src/screens/patientScreens/settings.dart';
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
import 'package:health_app/src/screens/splash_screen.dart';
import 'package:health_app/src/patient_navigation.dart';

class Routes {
  MaterialPageRoute<dynamic> routing(
      RouteSettings settings, BuildContext context) {
    WidgetBuilder builder;

    switch (settings.name) {
      //general routes
      case '/':
        builder = (context) => Splash();
        break;
      case 'hospital_register':
        builder = (context) => HospRegistration();
        break;
      case '/patient_register':
        builder = (context) => PatientReg();
        break;
      case '/welcoming_screen':
        builder = (context) => WelcomingScreen();
        break;
      case '/login':
        builder = (context) => LoginForm();
        break;

      //patient routings
      case '/patient':
        builder =
            (BuildContext context) => PatientNavigation(settings.arguments);
        break;
      case '/patient/edit_profile':
        builder =
            (BuildContext context) => PatientEditProfile(settings.arguments);
        break;
      case '/patient/settings':
        builder = (BuildContext context) => PatientSettings(settings.arguments);
        break;

      //hospital routings
      case '/hospital/home':
        builder = (BuildContext context) => HospitalHome();
        break;
      case '/hospital/add':
        builder = (BuildContext context) => AddScreen(settings.arguments);
        break;
      case '/hospital/history':
        builder = (BuildContext context) => HospitalHistory();
        break;
      case '/hospital/patient_appointment_list':
        builder = (BuildContext context) => PatientDetails(settings.arguments);
        break;
      case '/hospital/add_appointment':
        builder = (BuildContext context) => AddAppointment(settings.arguments);
        break;
      case '/hospital/add_medicine':
        builder = (BuildContext context) => AddMedicine();
        break;
      case '/hospital/update_appointment':
        builder =
            (BuildContext context) => UpdateAppointment(settings.arguments);
        break;
      case '/hospital/scanHospital':
        builder = (BuildContext context) => ScanHospital();

        break;
      case '/hospital/patientList':
        builder = (BuildContext context) =>
            PatientList(settings.arguments); //Expecting list of object Patient
        break;
      case '/hospital/profile':
        builder = (BuildContext context) => HospitalProfile(settings.arguments);
        break;
      case '/hospital/edit_profile':
        builder =
            (BuildContext context) => HospitalEditProfile(settings.arguments);
        break;
      case '/hospital/scanHospital':
        builder = (BuildContext context) => ScanHospital();

        break;
      case '/hospital/settings':
        builder =
            (BuildContext context) => HospitalSettings(settings.arguments);
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
