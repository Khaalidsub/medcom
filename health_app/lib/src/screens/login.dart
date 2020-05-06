import 'package:flutter/material.dart';
import 'package:health_app/src/hospital_navigation.dart';
import 'package:health_app/src/models/mockdata.dart';
import 'package:health_app/src/patient_navigation.dart';
import 'package:health_app/src/screens/welcoming_screen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  dynamic singIn(String email, String password) {
    var result;
    for (var i = 0; i < mockData.length; i++) {
      if (mockData[i].email == email && mockData[i].password == password) {
        result = mockData[i];
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double height = queryData.size.height;
    double width = queryData.size.width;

    return Scaffold(
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/land.jpg"),
              fit: BoxFit.cover,
            )),
            child: Container(
              color: Colors.white.withOpacity(0.8),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 35, left: 10),
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomingScreen())),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.arrow_left),
                          Text('Back'),
                        ],
                      ),
                    ),
                  ),
                  Form(
                    key: _formkey,
                    child: Padding(
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            // color: Colors.green,

                            height: 200,
                            child: Hero(
                              tag: 'logo',
                              child: Image.asset(
                                "assets/images/logo-01.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Email',
                                focusColor: Colors.white,
                                suffixIcon: Icon(Icons.mail),
                                hintText: 'Enter Email'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: Icon(Icons.edit),
                                focusColor: Colors.blue,
                                hintText: 'Enter Password'),
                            validator: (val) => val.length < 3
                                ? 'Enter a password more than 6 characters'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                splashColor: Colors.blueAccent,
                                elevation: 10,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                color: Colors.blue,
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                onPressed: () {
                                  if (_formkey.currentState.validate()) {
                                    setState(() => loading = true);
                                    dynamic result =
                                        singIn(email.trim(), password.trim());
                                    print(result);
                                    if (result.type == null) {
                                      setState(() {
                                        error = 'the email does not exist';
                                      });
                                      // showErrorMessage(context);
                                      Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.redAccent,
                                          content: Row(
                                            children: <Widget>[
                                              Text(error),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      if (result.type == 'patient') {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PatientNavigation(result)));
                                      } else {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HospitalNavigation()));
                                      }
                                    }
                                  }
                                },
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
                                'Forgot Password? ',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.blueGrey),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  void showErrorMessage(BuildContext context) {
    final snackbar = SnackBar(
      backgroundColor: Colors.pinkAccent,
      content: Text(
        error,
        style: TextStyle(color: Colors.white),
      ),
      duration: new Duration(seconds: 3),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
