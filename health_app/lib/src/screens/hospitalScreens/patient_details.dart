import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/blocs/hospital_blocs/patient_details_bloc.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/screens/hospitalScreens/patient_info.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/hospital_widgets/appointment_history_list.dart';
import 'package:health_app/src/screens/widgets/hospital_widgets/appointment_latest_list.dart';
import 'package:health_app/src/screens/widgets/progress_bar.dart';

class PatientDetails extends StatefulWidget {
  final String patientId;
  PatientDetails(this.patientId);
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails>
    with SingleTickerProviderStateMixin {
  final PatientDetailsBloc _patientDetailsBloc =
      BlocProvider.getBloc<PatientDetailsBloc>();
  TabController _controller;
  // void updateData(Patient p) {
  //   setState(() {
  //     widget.patient = p;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  // void updateAppointment(int index) async {
  //   final data = await Navigator.pushNamed(
  //     context,
  //     '/hospital/update_appointment',
  //     arguments: widget.patient.appointments[index],
  //   );
  //   print(data);
  //   if (data != null) {
  //     setState(() {
  //       widget.patient.appointments[index] = data;
  //     });
  //     print(widget.patient.appointments[index].doctorName);
  //   }
  // }
  @override
  void dispose() {
    _patientDetailsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _patientDetailsBloc.id = widget.patientId;
    MediaQueryData queryData = MediaQuery.of(context);
    // double width = queryData.size.width;
    double height = queryData.size.height;
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Appointments',
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<Object>(
          stream: _patientDetailsBloc.patient,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Patient patient = snapshot.data;
              print('herein patient details : ${patient.name}');
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: 15, bottom: 10), //test later with diff screen size
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/unknownPerson.jpg'),
                      radius: 60,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      patient.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 3 * height / 100,
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'appointment',
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/hospital/add_appointment',
                          arguments: Patient.copy(patient),
                        );
                      }, //add appointment Functionality goes here!
                      color: Colors.blue[600],
                      child: FittedBox(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              'Add Appointment',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: TabBar(
                      indicatorColor: Colors.blueAccent,
                      labelColor: Colors.black,
                      controller: _controller,
                      tabs: [
                        Tab(
                          icon: const Icon(
                            FontAwesomeIcons.calendarCheck,
                            color: Colors.blueAccent,
                          ),
                          text: "Latest Appointments",
                        ),
                        Tab(
                          icon: const Icon(
                            FontAwesomeIcons.history,
                            color: Colors.blueAccent,
                          ),
                          text: 'History',
                        ),
                        Tab(
                          icon: const Icon(
                            FontAwesomeIcons.user,
                            color: Colors.blueAccent,
                          ),
                          text: 'Info',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.5,
                    child: TabBarView(
                      controller:
                          _controller, //to control the sync of tabs and views
                      children: <Widget>[
                        //separate widgets that holds contents respectively for both tabs
                        LatestAppointmenContent(
                            appointments: patient.appointments
                                .where((test) => test.status == "latest")
                                .toList(),
                            updateAppointment: () => null),

                        AppointmenContent((patient.appointments
                            .where((test) => test.status == "history")
                            .toList())),

                        PatientInfo(patient)
                      ],
                    ),
                  ),
                ],
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ProgressBar(
                  color: Colors.blueAccent,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
