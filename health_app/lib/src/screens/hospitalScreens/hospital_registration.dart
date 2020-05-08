import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/input_field.dart';

class HospRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
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
          //registration card
          body: SingleChildScrollView(
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
                        color: Colors.white,
                        icon: Icon(Icons.local_hospital),
                        hint: 'e.g Will Smith',
                      ),
                      Reusablefield(
                        label: "Enter Email",
                        color: Colors.white,
                        icon: Icon(Icons.mail),
                        hint: 'e.g Smith@gmail.com',
                      ),
                      Reusablefield(
                        label: "Enter Phone",
                        color: Colors.white,
                        icon: Icon(Icons.phone),
                        hint: 'e.g 01125601863',
                      ),
                      Reusablefield(
                        label: "Enter Password",
                        color: Colors.white,
                        icon: Icon(Icons.vpn_key),
                        isPass: true,
                        hint: 'e.g Will Smith',
                      ),
                      Reusablefield(
                        label: "Confirm Password",
                        color: Colors.white,
                        icon: Icon(Icons.vpn_key),
                        isPass: true,
                        hint: 'e.g Will Smith',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: RaisedButton(
                    onPressed: () {},
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
          )),
    );
  }
}
