import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/blocs/hospital_blocs/hospital_settings_bloc.dart';
import 'package:health_app/src/blocs/hospital_navigation_bloc.dart';
import 'package:health_app/src/blocs/hospital_register_bloc.dart';
import 'package:health_app/src/blocs/login_bloc.dart';
import 'package:health_app/src/blocs/patient_edit_bloc.dart';
import 'package:health_app/src/blocs/patient_navigation_bloc.dart';
import 'package:health_app/src/blocs/patient_register_bloc.dart';
import 'package:health_app/src/blocs/patient_settings_bloc.dart';
import 'package:health_app/src/blocs/welcoming_screen_bloc.dart';

import 'package:health_app/src/utils/routing.dart';

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
        Bloc((i) => PatientEditProfileBloc()),
        Bloc((i) => HospitalRegisterBloc()),
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
