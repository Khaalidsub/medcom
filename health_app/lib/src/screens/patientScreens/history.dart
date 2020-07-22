import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/hospital_widgets/hospital_history_view.dart';
import 'package:health_app/src/blocs/patient_blocs/patient_history_bloc.dart';
import 'package:health_app/src/models/Appointement.dart';

import 'package:health_app/src/models/patient.dart';
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
                                    setState(() {
                                      patientBloc.daySink.add(index + 1);
                                      for (int i = 0;
                                          i < _daySelected.length;
                                          i++) {
                                        index == i
                                            ? _daySelected[i] = true
                                            : _daySelected[i] = false;
                                      }
                                    });
                                  },
                                  child: Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
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

  buildPatientHistoryScreen() {
    return StreamBuilder<List<Appointment>>(
        stream: patientBloc.fetchAppointments(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length != 0) {
              print(snapshot.data.length);
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
      list.add(HospitalHistoryView(item));
      list.add(HospitalHistoryView(item));
    }
    return list;
  }

  // or maybe we should write one appointment as not a list, idk, now everything works, but its not updates to display info
  /*
  getAppointment(Appointment appointment) {
    Appointment app = <Widget>[];
    app.add(HospitalHistoryView(1));
    return app;
  }
  */

}
