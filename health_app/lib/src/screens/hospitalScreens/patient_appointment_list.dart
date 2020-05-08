import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/screens/hospitalScreens/add_appointment.dart';

import 'package:health_app/src/screens/hospitalScreens/update_appointment.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/hospital_widgets/appointment_history_list.dart';
import 'package:health_app/src/screens/widgets/hospital_widgets/appointment_latest_list.dart';

class PatientDetails extends StatefulWidget {
  Patient patient;

  PatientDetails(this.patient);
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  void updateData(Patient p) {
    setState(() {
      widget.patient = p;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  void updateAppointment(int index) async {
    final data = await Navigator.pushNamed(
      context,
      '/update_appointment',
      arguments: widget.patient.appointments[index],
    );
    print(data);
    if (data != null) {
      setState(() {
        widget.patient.appointments[index] = data;
      });
      print(widget.patient.appointments[index].doctorName);
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    // double width = queryData.size.width;
    double height = queryData.size.height;
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Appointments',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: 15, bottom: 10), //test later with diff screen size
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/unknownPerson.jpg'),
                radius: 60,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text(
                widget.patient.name,
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
                    '/add_appointment',
                    arguments: Patient.copy(widget.patient),
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
                ],
              ),
            ),
            Container(
              height: height * 0.5,
              child: TabBarView(
                controller: _controller, //to control the sync of tabs and views
                children: <Widget>[
                  //separate widgets that holds contents respectively for both tabs
                  LatestAppointmenContent(
                      appointments: widget.patient.appointments
                          .where((test) => test.status == "latest")
                          .toList(),
                      updateAppointment: updateAppointment),

                  AppointmenContent((widget.patient.appointments
                      .where((test) => test.status == "history")
                      .toList()))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
