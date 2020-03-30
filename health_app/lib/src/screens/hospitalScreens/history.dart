import 'package:flutter/material.dart';

import 'package:health_app/src/screens/patientScreens/history.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/bottom_navigation.dart';
import 'package:health_app/src/screens/widgets/chart.dart';
import 'package:health_app/src/screens/widgets/patient_history_view.dart';

class HospitalHistory extends StatelessWidget {
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
                            )),
                          ),
                        );
                      })),
              Container(
                child: Text(
                  'Statistics',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: width,
                height: 150,
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Charts(),
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
                height: 250,
                child: PageView(
                  children: <Widget>[
                    PatientHistoryView(),
                    PatientHistoryView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}
