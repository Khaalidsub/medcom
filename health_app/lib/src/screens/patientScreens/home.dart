import 'package:flutter/material.dart';

import 'package:health_app/src/screens/widgets/chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PatientHome extends StatelessWidget {
  // Function changeIndex;
  // int index;
  // PatientHome({this.changeIndex, this.index});
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    double height = queryData.size.height;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Notification',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => {},
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.29,
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
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.29,
                    child: Card(
                      elevation: 10,
                      color: Color(0xff3D73DD),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.hospital,
                            color: Colors.white,
                            size: 50,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Hospitals',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.29,
                    child: Card(
                      elevation: 10,
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
            // Container(
            //   height: height * 0.10,
            //   width: width,
            //   child: Card(
            //     child: Text('alert'),
            //   ),
            // ),
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
    );
  }
}
