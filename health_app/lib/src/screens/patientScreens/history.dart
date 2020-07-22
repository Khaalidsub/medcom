import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/blocs/patient_blocs/patient_history_bloc.dart';
import 'package:health_app/src/models/Appointement.dart';

import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/screens/widgets/history_view.dart';
import 'package:health_app/src/utils/dates.dart';

class PatientHistory extends StatefulWidget {
  final Patient patient;
  PatientHistory(this.patient);
  @override
  _PatientHistoryState createState() => _PatientHistoryState();
}

class _PatientHistoryState extends State<PatientHistory> {
  final patientBloc = PatientHistoryBloc();
  static int days = 31;
  List<bool> _monthSelected = List.generate(12, (i) => false);
  List<bool> _daySelected = List.generate(days, (i) => false);
  DateTime _date = DateTime.now();

  // String month;

  @override
  void initState() {
    super.initState();
    days = getDays(_date.month);
    patientBloc.monthSink.add(_date.month);
    patientBloc.daySink.add(_date.day);
    _monthSelected[_date.month - 1] = true;
    _daySelected[_date.day - 1] = true;
  }

  @override
  Widget build(BuildContext context) {
    patientBloc.patientId = widget.patient.id;
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'History',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildMonths(width),
              buildDays(width),
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
                            '',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/images/heart.png'),
                          Text(
                            '',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/images/pressure.png'),
                          Text(
                            '',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/images/temp.png'),
                          Text(
                            '',
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
                    buildPatientHistoryScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildMonths(double width) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 5, left: 10),
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
                      for (int i = 0; i < _monthSelected.length; i++) {
                        index == i
                            ? _monthSelected[i] = true
                            : _monthSelected[i] = false;
                      }
                      patientBloc.monthSink.add(index + 1);
                      setState(() {
                        days = getDays(index + 1);
                      });
                      //sink the id
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: _monthSelected[index]
                          ? Colors.lightBlueAccent
                          : Color(0xff3D73DD),
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
        ],
      ),
    );
  }

  Container buildDays(double width) {
    return Container(
      height: 50,
      width: width * 1,
      margin: EdgeInsets.only(bottom: 20),
      child: ListView.builder(
        itemCount: days,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            width: 70,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  patientBloc.daySink.add(index + 1);
                  for (int i = 0; i < _daySelected.length; i++) {
                    index == i
                        ? _daySelected[i] = true
                        : _daySelected[i] = false;
                  }
                });
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: _daySelected[index]
                    ? Colors.lightBlueAccent
                    : Color(0xff3D73DD),
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
    );
  }

  buildPatientHistoryScreen() {
    return StreamBuilder<List<Appointment>>(
        stream: patientBloc.fetchAppointments(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length != 0) {
              return Container(
                height: 250,
                child: PageView(
                  children: getList(snapshot.data),
                ),
              );
            } else {
              return Text("There are no appointments for chosen dates.");
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  getList(List appointments) {
    List list = <Widget>[];
    for (var item in appointments) {
      list.add(AppointmentHistoryView(item));
    }
    return list;
  }
}
