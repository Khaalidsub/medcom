import 'package:flutter/material.dart';

import 'package:health_app/src/screens/widgets/chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HospitalHome extends StatefulWidget {
  final Widget child;

  HospitalHome({Key key, this.child}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HospitalHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    return Scaffold(
      //appBar: AppNav(
      //  appBar: AppBar(),
      //),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Notification',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/patientList'),
                    child: Container(
                      height: 120,
                      width: width * 0.29,
                      child: Card(
                        color: Color(0xffFFC4C4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.userMd,
                              color: Colors.grey,
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
                    onTap: () => Navigator.pushNamed(context, '/patientList'),
                    child: Container(
                      height: 120,
                      width: width * 0.29,
                      child: Card(
                        color: Color(0xffF5DD9C),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.pills,
                              color: Colors.grey,
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
                    child: Container(
                      height: 120,
                      width: width * 0.29,
                      child: Card(
                        color: Color(0xff8DDEDE),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.inbox,
                              color: Colors.grey,
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
                height: 10,
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
              Container(height: 400, child: Charts()),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}
