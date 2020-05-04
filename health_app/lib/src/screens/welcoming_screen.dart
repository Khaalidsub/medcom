import 'package:flutter/material.dart';
import 'package:health_app/src/screens/hospitalScreens/hospRegistration.dart';
import 'package:health_app/src/screens/patientScreens/patientReg.dart';
import 'package:health_app/src/screens/login.dart';

class WelcomingScreen extends StatefulWidget {
  @override
  _WelcomingScreenState createState() => _WelcomingScreenState();
}

class _WelcomingScreenState extends State<WelcomingScreen> {
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
        )),
        child: Container(
          color: Colors.blueAccent.withOpacity(0.8),
          padding: EdgeInsets.only(left: 40.0, right: 40.0),
          child: Column(
            children: <Widget>[
              Container(
                // color: Colors.green,
                height: 320,
                child: Column(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Image.asset(
                        "assets/images/logo-01.png",
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'MEDCOM',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'We Care For You',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.1),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      splashColor: Colors.blueAccent,
                      elevation: 10,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      color: Colors.white,
                      child: Text(
                        'Sign In',
                        style:
                            TextStyle(fontSize: 20, color: Colors.blueAccent),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context,'/login');
                           
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      splashColor: Colors.blueAccent,
                      elevation: 10,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      color: Colors.blue,
                      child: Text(
                        'Sign Up As A Patient',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {
                         Navigator.pushReplacementNamed(
                            context,'/patient_register');
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      splashColor: Colors.blueAccent,
                      elevation: 10,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      color: Colors.blue,
                      child: Text(
                        'Sign Up As A Hospital',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {
                       Navigator.pushNamed(
                            context,'/hospital_register');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}