import 'package:flutter/material.dart';
import 'package:health_app/src/models/mockdata.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';

import 'package:health_app/src/screens/widgets/chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HospitalHome extends StatefulWidget {
  final String hospitalId;

  HospitalHome(this.hospitalId);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HospitalHome> {
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Updates",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center),
            content: Text(
              "No updates",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            actions: [
              FlatButton(
                child: Text("Ok",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            elevation: 24.0,
            backgroundColor: Colors.blueAccent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    double height = queryData.size.height;
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Home',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Notification',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, '/hospital/patientList',
                        arguments: widget.hospitalId),
                    child: Container(
                      height: 120,
                      width: width * 0.29,
                      child: Card(
                        color: Color(0xff3D73DD),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.userMd,
                              color: Colors.white,
                              size: 50,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Appointments',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, '/hospital/patientList',
                        arguments: widget.hospitalId),
                    child: Container(
                      height: 120,
                      width: width * 0.29,
                      child: Card(
                        color: Color(0xff3D73DD),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.pills,
                              color: Colors.white,
                              size: 50,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Patients',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      createAlertDialog(context);
                    },
                    child: Container(
                      height: 120,
                      width: width * 0.29,
                      child: Card(
                        color: Color(0xff3D73DD),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.inbox,
                              color: Colors.white,
                              size: 50,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'updates',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: height * 0.35,
                child: Charts(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
