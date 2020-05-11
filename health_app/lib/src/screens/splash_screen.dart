import 'package:flutter/material.dart';
import 'package:health_app/src/screens/welcoming_screen.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen.navigate(
      name: 'assets/images/logo.flr',
      next: (context) => WelcomingScreen(),
      until: () => Future.delayed(Duration(seconds: 5)),
      startAnimation: 'go',
      backgroundColor: Colors.blueAccent,
    );
  }
}
