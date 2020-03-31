import 'package:flutter/material.dart';
import 'package:health_app/src/screens/hospitalScreens/hospRegistration.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double height = queryData.size.height;
    double width = queryData.size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 31.2, right: 31.2, top: height * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    // color: Colors.green,
                    child: Image.asset("assets/images/logo.png",
                        width: width * 0.2, height: height * 0.2),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 40,
                      fontWeight: FontWeight.w100,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    focusColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey[700], width: 2.0),
                        borderRadius: BorderRadius.circular(10)
                        // borderRadius: BorderRadius.circular(25.0),
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueGrey[700], width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter Email'),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password',
                    focusColor: Colors.blue,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2.0),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter Password'),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FloatingActionButton(
                    isExtended: true,
                    child: Text('Sign In'),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'New User? ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => HospRegistration,
                    child: Text(
                      'Patient Sign up',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5d74e3)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Hospital Sign up',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5d74e3)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
