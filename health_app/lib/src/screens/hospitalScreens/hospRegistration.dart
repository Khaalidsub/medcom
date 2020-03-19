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
            backgroundColor: Color(0xffFFFEDE),
            elevation: 0,
            title: Text(""),
            //later put on press goto back page
            leading: Icon(
              Icons.arrow_back,
              color: Colors.black,
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
                          fillColor: Color(0xffFFFEDE),
                          filled: true,
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: "Hospital Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(color: Color(0xffE6E5BF), width: 2),
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.mail,
                            color: Colors.grey,
                          ),
                          fillColor: Color(0xffFFFEDE),
                          filled: true,
                          labelText: "Enter Email",
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(color: Color(0xffE6E5BF), width: 2),
                          ),
                        ),
                      ),
                      TextField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.book,
                                color: Colors.grey,
                              ),
                              fillColor: Color(0xffFFFEDE),
                              filled: true,
                              labelText: "Enter Address",
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(
                                    color: Color(0xffE6E5BF),
                                    width: 2,
                                  )))),
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          fillColor: Color(0xffFFFEDE),
                          filled: true,
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: "Enter Phone",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Color(0xffE6E5BF),
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
                          fillColor: Color(0xffFFFEDE),
                          filled: true,
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: "Director Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Color(0xffE6E5BF),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Director Email",
                          labelStyle: TextStyle(color: Colors.black),
                          fillColor: Color(0xffFFFEDE),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Color(0xffE6E5BF),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Enter Email",
                          labelStyle: TextStyle(color: Colors.black),
                          fillColor: Color(0xffFFFEDE),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Color(0xffE6E5BF),
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
                  disabledColor: Colors.amber,
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
