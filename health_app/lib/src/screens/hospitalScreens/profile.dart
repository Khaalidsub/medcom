import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/app.dart';
import 'package:health_app/src/screens/widgets/bottom_navigation.dart';

class HospitalProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          leading: Image.asset('assets/images/logo.png'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.signOutAlt,
                  color: Colors.black,
                ),
                onPressed: null)
          ],
          backgroundColor: Color(0xffFFFEDE),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 60),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.lime[400],
                      backgroundImage:
                          AssetImage("assets/images/buildingIcon.png"),

                      radius: 60,
                      //adding a background Image later.
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "Name : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text("ID : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        Text("Email : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Text(
              "Hospital Details",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.lime[200],
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              width: 400,
              height: 350,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //*** Adjust overflow thing in the container**/
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          FontAwesomeIcons.bed,
                          color: Colors.black54,
                        ),
                        margin: EdgeInsets.only(right: 20),
                      ),
                      Text("Bed Count: Lorem ipsum",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.people,
                          color: Colors.black54,
                        ),
                        margin: EdgeInsets.only(right: 20),
                      ),
                      Text("Doctors:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          FontAwesomeIcons.phone,
                          color: Colors.black54,
                        ),
                        margin: EdgeInsets.only(right: 20),
                      ),
                      Text("Phone: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          FontAwesomeIcons.locationArrow,
                          color: Colors.black54,
                        ),
                        margin: EdgeInsets.only(right: 20),
                      ),
                      Text("location: ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  )
                ],
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    (30),
                  ),
                ),
              ),
              onPressed: null,
              disabledColor: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text(
                "Update Details",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}
