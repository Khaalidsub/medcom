import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/blocs/hospital_blocs/appointment_block.dart';
import 'package:health_app/src/blocs/hospital_blocs/hospital_navigation_bloc.dart';
import 'package:health_app/src/blocs/hospital_blocs/hospital_register_bloc.dart';
import 'package:health_app/src/blocs/hospital_blocs/hospital_settings_bloc.dart';
import 'package:health_app/src/blocs/hospital_blocs/medicine_block.dart';
import 'package:health_app/src/blocs/hospital_blocs/patient_List_bloc.dart';
import 'package:health_app/src/blocs/hospital_blocs/patient_details_bloc.dart';
import 'package:health_app/src/blocs/hospital_blocs/update_appointment_block.dart';
import 'package:health_app/src/blocs/login_bloc.dart';
import 'package:health_app/src/blocs/patient_blocs/patient_appointment_list_bloc.dart';
import 'package:health_app/src/blocs/patient_blocs/patient_edit_bloc.dart';
import 'package:health_app/src/blocs/patient_blocs/patient_history_bloc.dart';
import 'package:health_app/src/blocs/patient_blocs/patient_navigation_bloc.dart';
import 'package:health_app/src/blocs/patient_blocs/patient_register_bloc.dart';
import 'package:health_app/src/blocs/patient_blocs/patient_settings_bloc.dart';
import 'package:health_app/src/blocs/scan_patient_profile_bloc.dart';
import 'package:health_app/src/blocs/welcoming_screen_bloc.dart';
import 'package:health_app/src/utils/routing.dart';

import 'blocs/patient_blocs/appointment_details_bloc.dart';

// import 'package:health_app/src/screens/splash_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Widget changePage(BuildContext context) {
  //   return WelcomingScreen();
  // }

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => WelcomingScreenBloc()),
        Bloc((i) => PatientNavigationBloc()),
        Bloc((i) => HospitalNavigationBloc()),
        Bloc((i) => LoginBloc()),
        Bloc((i) => PatientRegisterBloc()),
        Bloc((i) => PatientSettingsBloc()),
        Bloc((i) => HospitalSettingsBloc()),
        Bloc((i) => PatientDetailsBloc()),
        Bloc((i) => ScanPatientProfileBloc()),
        Bloc((i) => PatientListBloc()),
        Bloc((i) => PatientEditProfileBloc()),
        Bloc((i) => HospitalRegisterBloc()),
        Bloc((i) => AppointmentBloc()),
        Bloc((i) => MedicineBloc()),
        Bloc((i) => AppointementEditeBloc()),
        Bloc((i) => AppointementListBloc()),
        Bloc((i) => AppointmentDetailsBloc()),
        Bloc((i) => PatientHistoryBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        // home: buildSplashScreen(),
        navigatorKey: navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          //creating instance of hospital routing to return the materialPage route.
          Routes routing = Routes();
          return routing.routing(settings, context);
        },
      ),
    );
  }
}
