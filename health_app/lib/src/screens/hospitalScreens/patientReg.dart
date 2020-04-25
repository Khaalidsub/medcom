import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
                onTap:  () => Navigator.pop(context),
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
                  "assets/images/img.png",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 5, 25, 15),
              child: Wrap(
                runSpacing: 20,
                children: <Widget>[
                  Reusablefield(
                    label: "Enter Date",
                    color: Colors.white,
                    icon: Icon(Icons.date_range),
                    type: 'Date',
                    hint: 'e.g 02/03/2020',
                  ),
                  Reusablefield(
                    label: "Enter Time",
                    color: Colors.white,
                    icon: Icon(Icons.timer),
                    type: 'Time',
                    hint: 'e.g 15:00',
                  ),
                  Reusablefield(
                    label: "Enter Comment",
                    color: Colors.white,
                    icon: Icon(Icons.person),
                    type: 'Comment',
                    hint: 'e.g any',
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

class Reusablefield extends StatelessWidget {
  final String label;
  final Color color;
  final bool isPass;
  final Icon icon;
  final String type;
  final String hint;
  Reusablefield(
      {@required this.label,
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
