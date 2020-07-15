import 'package:flutter/material.dart';
import 'package:health_app/src/blocs/hospital_blocs/hospital_history_bloc.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/chart.dart';
import 'package:health_app/src/screens/widgets/patient_widgets/patient_history_view.dart';

class HospitalHistory extends StatefulWidget {
  final String hospitalId;
  HospitalHistory(this.hospitalId);
  @override
  _HospitalHistoryState createState() => _HospitalHistoryState();
}

class _HospitalHistoryState extends State<HospitalHistory> {
  final historyBloc = HospitalHistoryBloc();
  static int days;
  List<bool> _selected = List.generate(12, (i) => false);
  List<bool> _daySelected = List.generate(days, (i) => false);
  DateTime _date = DateTime.now();

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
    historyBloc.hospitalId = widget.hospitalId;
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
                                for (int i = 0; i < _selected.length; i++) {
                                  index == i
                                      ? _selected[i] = true
                                      : _selected[i] = false;
                                }
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
                                color: _selected[index]
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
                          setState(() {
                            historyBloc.daySink.add(index + 1);
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
              buildPatientHistoryScreen(),
            ],
          ),
        ),
      ),
    );
  }

  buildPatientHistoryScreen() {
    return StreamBuilder<List<Appointment>>(
        stream: historyBloc.fetchAppointments(),
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
      list.add(PatientHistoryView(item));
    }
    return list;
  }
}
