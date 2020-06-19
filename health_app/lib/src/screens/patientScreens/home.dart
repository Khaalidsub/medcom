import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';

import 'package:health_app/src/screens/widgets/chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PatientHome extends StatefulWidget {
// Function changeIndex;
// int index;
// PatientHome({this.changeIndex, this.index});

  @override
  _PatientHomeState createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
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
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text('Todays date'),
                        Text('Next Appointment'),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.2,
                    width: width * 0.29,
                    // alignment: Alignment.centerRight,

                    child: GestureDetector(
                      onTap: () => {},
                      child: Card(
                        elevation: 10,
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
