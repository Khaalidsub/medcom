import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/bottom_navigation.dart';
import 'package:health_app/src/screens/widgets/hospital_history_view.dart';

class PatientHistory extends StatelessWidget {
  // Function changeIndex;
  // int index;
  // PatientHistory({this.changeIndex, this.index});
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 15),
              child: Text(
                'Dates',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
                height: 120,
                width: width * 1,
                margin: EdgeInsets.only(bottom: 20),
                child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: 100,
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0xff3D73DD),
                          child: Center(
                            child: Text(
                              '$index',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    })),
            Container(
              child: Text(
                'Statistics',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              width: width,
              height: 120,
              child: Card(
                elevation: 10,
                color: Color(0xff3D73DD),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.gesture),
                        Text(
                          'data',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/heart.png'),
                        Text(
                          'data',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/pressure.png'),
                        Text(
                          'data',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/temp.png'),
                        Text(
                          'data',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Apppointment',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: width,
              height: 250,
              child: PageView(
                children: <Widget>[
                  HospitalHistoryView(),
                  HospitalHistoryView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
