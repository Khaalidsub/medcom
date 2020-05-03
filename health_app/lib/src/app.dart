import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/screens/hospitalScreens/hospRegistration.dart';
import 'package:health_app/src/screens/login.dart';
import 'package:health_app/src/screens/patientScreens/patientReg.dart';
import 'package:health_app/src/screens/welcoming_screen.dart';
// import 'package:health_app/src/screens/splash_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Widget changePage(BuildContext context) {
  //   return WelcomingScreen();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      // home: buildSplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => buildSplashScreen(),
        '/login': (context) => LoginForm(),
        '/hospital_register': (context) => HospRegistration(),
        '/patient_register': (context) => PatientReg(),
        '/welcoming_screen': (context) => WelcomingScreen(),
        
      },
    );
  }

  SplashScreen buildSplashScreen() {
    return SplashScreen.navigate(
      name: 'assets/images/logo.flr',
      next: (context) => WelcomingScreen(),
      until: () => Future.delayed(Duration(seconds: 5)),
      startAnimation: 'go',
      backgroundColor: Colors.blueAccent,
    );
  }
}
