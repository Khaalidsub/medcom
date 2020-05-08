import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/input_field.dart';

import '../welcoming_screen.dart';

class PatientReg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          //registration card
          body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 35, left: 10),
              child: GestureDetector(
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => WelcomingScreen())),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_left,
                      size: 30,
                    ),
                    Text('Back'),
                  ],
                ),
              ),
            ),
            Container(
              height: 200,
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  "assets/images/logo-01.png",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 5, 25, 15),
              child: Wrap(
                runSpacing: 20,
                children: <Widget>[
                  Reusablefield(
                    label: "Enter Name",
                    color: Colors.white,
                    icon: Icon(Icons.local_hospital),
                    type: TextInputType.text,
                    hint: 'e.g Will Smith',
                  ),
                  Reusablefield(
                    label: "Enter Email",
                    color: Colors.white,
                    icon: Icon(Icons.mail),
                    type: TextInputType.emailAddress,
                    hint: 'e.g willsmith20@gmail.com',
                  ),
                  Reusablefield(
                    label: "Enter Phone",
                    color: Colors.white,
                    icon: Icon(Icons.phone),
                    type: TextInputType.phone,
                    hint: 'e.g +6012xxxxxxxx',
                  ),
                  Reusablefield(
                    label: "Enter Age",
                    color: Colors.white,
                    icon: Icon(Icons.person),
                    type: TextInputType.number,
                    hint: 'e.g 25',
                  ),
                  Reusablefield(
                    label: "Enter Password",
                    color: Colors.white,
                    icon: Icon(Icons.vpn_key),
                    isPass: true,
                    hint: 'e.g Will20@Smith',
                  ),
                  Reusablefield(
                    label: "Confirm Password",
                    color: Colors.white,
                    icon: Icon(Icons.vpn_key),
                    isPass: true,
                    hint: 'Rewrite Password Again',
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: RaisedButton(
                onPressed: null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                disabledColor: Colors.blueAccent,
                child: Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
