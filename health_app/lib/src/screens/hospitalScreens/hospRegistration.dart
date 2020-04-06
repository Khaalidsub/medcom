import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HospRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          backgroundColor: Colors.grey[50],
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
            title: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {}, //pop this screen from navigator stack.
                    ),
                    Text('Back')
                  ],
                )),
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
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Wrap(
                    runSpacing: 20,
                    children: <Widget>[
                      Reusablefield(
                        label: "Enter Name",
                        color: Colors.white,
                        icon: Icon(Icons.local_hospital),
                      ),
                      Reusablefield(
                        label: "Enter Email",
                        color: Colors.white,
                        icon: Icon(Icons.mail),
                      ),
                      Reusablefield(
                        label: "Enter Phone",
                        color: Colors.white,
                        icon: Icon(Icons.phone),
                      ),
                      Reusablefield(
                        label: "Enter Drirector Name",
                        color: Colors.white,
                        icon: Icon(Icons.person),
                      ),
                      Reusablefield(
                        label: "Enter Password",
                        color: Colors.white,
                        icon: Icon(Icons.vpn_key),
                        isPass: true,
                      ),
                      Reusablefield(
                        label: "Confirm Password",
                        color: Colors.white,
                        icon: Icon(Icons.vpn_key),
                        isPass: true,
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

class Reusablefield extends StatelessWidget {
  final String label;
  final Color color;
  final bool isPass;
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
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 0, style: BorderStyle.none)),
          //border: OutlineInputBorder(
          //  borderRadius: BorderRadius.all(
          //    Radius.circular(30),
          //  ),
          //),
          //  focusedBorder: OutlineInputBorder(
          //    borderRadius: BorderRadius.all(Radius.circular(30)),
          //    borderSide: BorderSide(color: Color(0xffE6E5BF), width: 2),
          //  ),
          //),
        ));
  }
}
