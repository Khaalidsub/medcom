import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/bottom_navigation.dart';

class HospRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.orange,
            elevation: 0,
            title: Text(""),
            //later put on press goto back page
            leading: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
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
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "Hospital Registration",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30),
                  ),
                ),
                Container(
                  //height: 500,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 10,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(50, 80, 50, 20),
                  child: Wrap(
                    runSpacing: 20,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.local_hospital,
                            color: Colors.grey,
                          ),
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: "Hospital Name",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2),
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.mail,
                            color: Colors.grey,
                          ),
                          labelText: "Enter Email",
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2),
                          ),
                        ),
                      ),
                      TextField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.book,
                                color: Colors.grey,
                              ),
                              labelText: "Enter Address",
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.orange,
                                width: 2,
                              )))),
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: "Enter Phone",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: "Director Name",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Director Email",
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Enter Email",
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  disabledColor: Colors.orange,
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
