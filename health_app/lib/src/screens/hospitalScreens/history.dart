import 'package:flutter/material.dart';
import 'package:health_app/src/blocs/hospital_blocs/hospital_history_bloc.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/chart.dart';
import 'package:health_app/src/screens/widgets/patient_widgets/patient_history_view.dart';

class HospitalHistory extends StatefulWidget {
  @override
  _HospitalHistoryState createState() => _HospitalHistoryState();
}

class _HospitalHistoryState extends State<HospitalHistory> {
  final historyBloc = HospitalHistoryBloc();
  DateTime _date = DateTime.now();
  int days;
  // String month;
  void getDays([int month]) {
    if (month == 2) {
      days = 28;
    } else if (month % 2 == 0) {
      days = 30;
    } else
      days = 31;
  }

  String getMonth(int index) {
    switch (index) {
      case 1:
        return 'Jan';
        break;
      case 2:
        return 'Feb';
        break;
      case 3:
        return 'Mar';
        break;
      case 4:
        return 'Apr';
        break;
      case 5:
        return 'May';
        break;
      case 6:
        return 'Jun';
        break;
      case 7:
        return 'Jul';
        break;
      case 8:
        return 'Aug';
        break;
      case 9:
        return 'Sep';
        break;
      case 10:
        return 'Oct';
        break;
      case 11:
        return 'Nov';
        break;
      case 12:
        return 'Dec';
        break;
      default:
        return 'month';
    }
  }

  @override
  void initState() {
    super.initState();

    getDays(_date.month);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Hisotry',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 15, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Dates',
                      style: TextStyle(fontSize: 25),
                    ),

                    Container(
                      height: 50,
                      width: width * 1,
                      margin: EdgeInsets.only(bottom: 20),
                      child: ListView.builder(
                        itemCount: 12,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            width: 50,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  getDays(index + 1);
                                });
                                //sink the id
                                historyBloc.monthSink.add(index + 1);
                              },
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Color(0xff3D73DD),
                                child: Center(
                                    child: Text(
                                  getMonth(index + 1),
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    //       Wrap(
                    //         spacing: 10,
                    //         direction: Axis.horizontal,
                    //         children: <Widget>[
                    //           GestureDetector(
                    //               onTap: () => getDate(DateTime.may),
                    //               child: Text('May')),
                    //           GestureDetector(onTap: () {}, child: Text('June')),
                    //           GestureDetector(onTap: () {}, child: Text('July')),
                    //         ],
                    //       ),
                  ],
                ),
              ),
              Container(
                height: 120,
                width: width * 1,
                margin: EdgeInsets.only(bottom: 20),
                child: ListView.builder(
                  itemCount: days,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: 100,
                      child: GestureDetector(
                        onTap: () {
                          historyBloc.daySink.add(index + 1);
                          //once day is chosen, initiate the fetching of Appointments
                          historyBloc.fetchAppointments();
                        },
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0xff3D73DD),
                          child: Center(
                              child: Text(
                            '${index + 1}',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    );
                  },
                ),
              ),
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
                    PatientHistoryView(), //send here
                    PatientHistoryView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
