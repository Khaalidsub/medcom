import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../welcoming_screen.dart';
import '../../models/patient.dart';
import '../../models/mockdata.dart';

class PatientUpdate extends StatelessWidget {
  final Patient data; //should be copy data

  PatientUpdate(this.data);

  final TextEditingController bloodtype = new TextEditingController();
  final TextEditingController familyNumber = new TextEditingController();
  final TextEditingController allergese = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
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
                    controller: bloodtype,
                    label: "${data.bloodType}",
                    color: Colors.white,
                    icon: Icon(Icons.local_hospital),
                    type: 'name',
                    hint: 'e.g A+',
                  ),
                  Reusablefield(
                    controller: familyNumber,
                    label: "${data.familyNumber ?? '+601103024'}",
                    color: Colors.white,
                    icon: Icon(Icons.phone),
                    type: 'phone',
                    hint: 'e.g +6011616178',
                  ),
                  Reusablefield(
                    controller: allergese,
                    label: "${data.alergese}",
                    color: Colors.white,
                    icon: Icon(FontAwesomeIcons.bookMedical),
                    type: 'allergese',
                    hint: 'e.g Value, value, value',
                  ),
                  Reusablefield(
                    controller: phone,
                    label: "${data.phoneNumber}",
                    color: Colors.white,
                    icon: Icon(Icons.phone),
                    type: 'phone',
                    hint: 'e.g +6011838393',
                  ),
                  Reusablefield(
                    controller: password,
                    label: "${data.password}",
                    color: Colors.white,
                    icon: Icon(Icons.vpn_key),
                    isPass: true,
                    hint: 'e.g your password',
                  ),
                  Reusablefield(
                    controller: confirmPassword,
                    label: "${data.password}",
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
                color: Colors.blueAccent,
                onPressed: () {
                  if (password.text == confirmPassword.text) {
                    //do something here.

                    this.data.bloodType = bloodtype.text;
                    this.data.familyNumber = familyNumber.text;
                    this.data.alergese = allergese.text;
                    this.data.password = password.text;
                    this.data.phoneNumber = phone.text;

                    showDialog(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Success'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text("Details Have been adden successfully!"),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Alright'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); //pop the dialog box
                                Navigator.pop(context,
                                    this.data); //sending back the updated data...
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
                  "Update",
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
        keyboardType: type == 'phone' ? TextInputType.phone : null,
        inputFormatters: type == 'phone'
            ? [
                WhitelistingTextInputFormatter(RegExp("[+0-9]")),
                LengthLimitingTextInputFormatter(13),
              ]
            : type == 'allegese'
                ? [
                    WhitelistingTextInputFormatter(RegExp("[a-z A-Z]")),
                    LengthLimitingTextInputFormatter(50)
                  ]
                : null,
        obscureText: isPass == null ? false : isPass,
        controller: this.controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          suffixIcon: icon,
          fillColor: color,
          filled: true,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 0, style: BorderStyle.none)),
        ));
  }
}
