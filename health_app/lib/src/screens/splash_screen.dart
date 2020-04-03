import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dart:async';

import 'package:health_app/src/screens/welcoming_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 8),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => WelcomingScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double height = queryData.size.height;
    double width = queryData.size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/land.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.blueAccent.withOpacity(0.8),
          padding: EdgeInsets.only(left: 40.0, right: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: width,
                height: height * 0.45,
                child: FlareActor("assets/images/logo.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    animation: "go"),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: SpinKitChasingDots(
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
