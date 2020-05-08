import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../welcoming_screen.dart';
import '../../models/patient.dart';
import '../../models/mockdata.dart';

class PatientReg extends StatelessWidget {
  Patient data;

  final TextEditingController name = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController age = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmPassword = new TextEditingController();

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
                    controller: name,
                    label: "Enter Name",
                    color: Colors.white,
                    icon: Icon(Icons.local_hospital),
                    type: 'name',
                    hint: 'e.g Will Smith',
                  ),
                  Reusablefield(
                    controller: email,
                    label: "Enter Email",
                    color: Colors.white,
                    icon: Icon(Icons.mail),
                    type: 'email',
                    hint: 'e.g willsmith20@gmail.com',
                  ),
                  Reusablefield(
                    controller: phone,
                    label: "Enter Phone",
                    color: Colors.white,
                    icon: Icon(Icons.phone),
                    type: 'phone',
                    hint: 'e.g +6012xxxxxxxx',
                  ),
                  Reusablefield(
                    controller: age,
                    label: "Enter Age",
                    color: Colors.white,
                    icon: Icon(Icons.person),
                    type: 'age',
                    hint: 'e.g 25',
                  ),
                  Reusablefield(
                    controller: password,
                    label: "Enter Password",
                    color: Colors.white,
                    icon: Icon(Icons.vpn_key),
                    isPass: true,
                    hint: 'e.g Will20@Smith',
                  ),
                  Reusablefield(
                    controller: confirmPassword,
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
                onPressed: () {
                  if (password.text == confirmPassword.text) {
                    data = Patient(
                        name: name.text,
                        email: email.text,
                        age: int.parse(age.text),
                        password: password.text,
                        phoneNumber: phone.text);
                    mockData.add(data);
                    showDialog(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Patient Registeration'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(
                                    "Patient Register Was Successful. Please Login."),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Okay'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); //pop the dialog box
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Password Donot Match..'),
                        backgroundColor: Colors.red));
                  }
                },
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

class Reusablefield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Color color;
  final bool isPass;
  final Icon icon;
  final String type;
  final String hint;
  Reusablefield(
      {@required this.controller,
      @required this.label,
      @required this.color,
      @required this.icon,
      @required this.hint,
      this.isPass,
      this.type});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: type == 'email'
            ? TextInputType.emailAddress
            : type == 'phone'
                ? TextInputType.phone
                : type == 'age' ? TextInputType.number : null,
        inputFormatters: type == 'phone'
            ? [
                WhitelistingTextInputFormatter(RegExp("[+0-9]")),
                LengthLimitingTextInputFormatter(13),
              ]
            : type == 'age'
                ? [
                    WhitelistingTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                  ]
                : type == 'name'
                    ? [
                        WhitelistingTextInputFormatter(RegExp("[a-z A-Z]")),
                        LengthLimitingTextInputFormatter(50)
                      ]
                    : type == 'email'
                        ? [
                            WhitelistingTextInputFormatter(
                                RegExp("[a-zA-Z0-9@._-]")),
                            LengthLimitingTextInputFormatter(50)
                          ]
                        : null,
        obscureText: isPass == null ? false : isPass,
        controller: this.controller,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: icon,
          fillColor: color,
          filled: true,
          labelText: label,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 0, style: BorderStyle.none)),
        ));
  }
}
