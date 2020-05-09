import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/input_field.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/models/hospital.dart';
import '../../models/mockdata.dart';

class HospRegistration extends StatelessWidget {
  Hospital data;

  final TextEditingController name = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmPassword = new TextEditingController();
  final TextEditingController phoneNumber = new TextEditingController();
  final TextEditingController dirName = new TextEditingController();
  final TextEditingController numOfBeds = new TextEditingController();
  final TextEditingController address = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          titleSpacing: 0,
        ),
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      "assets/images/logo-01.png",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Wrap(
                    runSpacing: 20,
                    children: <Widget>[
                      Reusablefield(
                        label: "Enter Name",
                        controller: name,
                        type: "name",
                        color: Colors.white,
                        icon: Icon(FontAwesomeIcons.hospital),
                      ),
                      Reusablefield(
                        label: "Enter Email",
                        controller: email,
                        type: "email",
                        color: Colors.white,
                        icon: Icon(Icons.mail),
                      ),
                      Reusablefield(
                        label: "Enter Phone",
                        controller: phoneNumber,
                        type: "phone",
                        color: Colors.white,
                        icon: Icon(Icons.phone),
                      ),
                      Reusablefield(
                        label: "Enter Address",
                        controller: address,
                        type: "address",
                        color: Colors.white,
                        icon: Icon(Icons.location_on),
                      ),
                      Reusablefield(
                        label: "Enter Number Of Beds",
                        controller: numOfBeds,
                        color: Colors.white,
                        type: "numBed",
                        icon: Icon(FontAwesomeIcons.bed),
                      ),
                      Reusablefield(
                        label: "Enter Drirector Name",
                        controller: dirName,
                        color: Colors.white,
                        type: "name",
                        icon: Icon(Icons.person),
                      ),
                      Reusablefield(
                        label: "Enter Password",
                        controller: password,
                        color: Colors.white,
                        type: "pass",
                        icon: Icon(Icons.vpn_key),
                        isPass: true,
                      ),
                      Reusablefield(
                        label: "Confirm Password",
                        controller: confirmPassword,
                        color: Colors.white,
                        type: "pass",
                        icon: Icon(Icons.vpn_key),
                        isPass: true,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: RaisedButton(
                    onPressed: () {
                      if (password.text == confirmPassword.text) {
                        data = Hospital(
                            name: name.text,
                            email: email.text,
                            address: address.text,
                            dirName: dirName.text,
                            numOfBeds: int.parse(numOfBeds.text),
                            password: password.text,
                            phoneNumber: phoneNumber.text);
                        mockData.add(data);
                        showDialog(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Hospital Registeration'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                        "Hospital Register Was Successful. Please Login."),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                    color: Colors.blueAccent,
                    //disabledColor: Colors.blueAccent,
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
          ),
        ));
  }
}

class Reusablefield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Color color;
  final bool isPass;
  final Icon icon;
  final String type;
  Reusablefield(
      {@required this.label,
      @required this.color,
      @required this.icon,
      @required this.controller,
      @required this.type,
      this.isPass});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: type == 'email'
            ? TextInputType.emailAddress
            : type == 'phone'
                ? TextInputType.phone
                : type == 'numBed' ? TextInputType.number : null,
        inputFormatters: type == 'phone'
            ? [
                WhitelistingTextInputFormatter(RegExp("[+0-9]")),
                LengthLimitingTextInputFormatter(13),
              ]
            : type == 'numBed'
                ? [
                    WhitelistingTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(5),
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
        validator: (value) {
          if (value.trim().isEmpty) {
            return 'This is required';
          }
          return null;
        },
        obscureText: isPass == null ? false : isPass,
        controller: this.controller,
        decoration: InputDecoration(
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
