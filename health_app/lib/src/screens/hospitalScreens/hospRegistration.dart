import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/bottom_navigation.dart';

class HospRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppNav(
            appBar: AppBar(),
          ),
          //registration card
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/images/bigLogo.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    "Hospital Registration",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 15, 25, 15),
                  child: Wrap(
                    runSpacing: 20,
                    children: <Widget>[
                      Reusablefield(
                        label: "Enter Name",
                        color: Colors.blue[50],
                        icon: Icon(Icons.local_hospital),
                      ),
                      Reusablefield(
                        label: "Enter Email",
                        color: Colors.blue[50],
                        icon: Icon(Icons.mail),
                      ),
                      Reusablefield(
                        label: "Enter Phone",
                        color: Colors.blue[50],
                        icon: Icon(Icons.phone),
                      ),
                      Reusablefield(
                        label: "Enter Drirector Name",
                        color: Colors.blue[50],
                        icon: Icon(Icons.person),
                      ),
                      Reusablefield(
                        label: "Enter Password",
                        color: Colors.blue[50],
                        icon: Icon(Icons.vpn_key),
                        isPass: true,
                      ),
                      Reusablefield(
                        label: "Confirm Password",
                        color: Colors.blue[50],
                        icon: Icon(Icons.vpn_key),
                        isPass: true,
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
  bool isPass;
  final Icon icon;
  Reusablefield(
      {@required this.label,
      @required this.color,
      @required this.icon,
      this.isPass});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //validator: (String value) {
      //  if (value.trim().isEmpty) {
      //    return 'This is required';
      //  }
      //},
      obscureText: isPass == null ? false : isPass,
      decoration: InputDecoration(
        suffixIcon: icon,
        fillColor: color,
        filled: true,
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Color(0xffE6E5BF), width: 2),
        ),
      ),
    );
  }
}
