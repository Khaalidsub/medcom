import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/blocs/hospital_blocs/patient_details_bloc.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/hospital_widgets/appointment_history_list.dart';
import 'package:health_app/src/screens/widgets/hospital_widgets/appointment_latest_list.dart';
import 'package:health_app/src/screens/widgets/hospital_widgets/patient_info.dart';
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

  List<Appointment> appointments;
  Patient patient;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  void updateAppointment(int index) async {
    final data = await Navigator.pushNamed(
      context,
      '/hospital/update_appointment',
      arguments: appointments[index].id,
    );
    print(data);
    if (data != null) {
      setState(() {
        appointments[index] = data;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _patientDetailsBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _patientDetailsBloc.id = widget.patientId;
    MediaQueryData queryData = MediaQuery.of(context);
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
              patient = snapshot.data;
              _patientDetailsBloc.appointmentIds = patient.appointments;
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
                  buildAddButton(context, patient.email),
                  buildTabInfo(),
                  StreamBuilder<Object>(
                    stream: _patientDetailsBloc.appointmentList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        appointments = snapshot.data;

                        return buildFetchedAppointment(
                            height, appointments, patient);
                      }
                      return buildLoadingAppointment(height, patient);
                    },
                  ),
                ],
              );
            }
            return buildLoadingPatientData();
          },
        ),
      ),
    );
  }

  Column buildLoadingPatientData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ProgressBar(
          color: Colors.blueAccent,
        )
      ],
    );
  }

  Container buildLoadingAppointment(double height, Patient patient) {
    return Container(
      height: height * 0.5,
      child: TabBarView(
        controller: _controller, //to control the sync of tabs and views
        children: <Widget>[
          //separate widgets that holds contents respectively for both tabs
          ProgressBar(
            color: Colors.blueAccent,
          ),
          ProgressBar(
            color: Colors.blueAccent,
          ),
          PatientInfo(patient)
        ],
      ),
    );
  }

  Hero buildAddButton(BuildContext context, String email) {
    return Hero(
      tag: 'appointment',
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/hospital/add_appointment',
            arguments: email,
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
    );
  }

  Container buildTabInfo() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: TabBar(
        indicatorColor: Colors.blueAccent,
        labelColor: Colors.black,
        controller: _controller,
        tabs: [
          Tab(
            icon: Icon(
              FontAwesomeIcons.calendarCheck,
              color: Colors.blueAccent,
            ),
            text: "Latest Appointments",
          ),
          Tab(
            icon: Icon(
              FontAwesomeIcons.history,
              color: Colors.blueAccent,
            ),
            text: 'History',
          ),
          Tab(
            icon: Icon(
              FontAwesomeIcons.user,
              color: Colors.blueAccent,
            ),
            text: 'Info',
          ),
        ],
      ),
    );
  }

  Container buildFetchedAppointment(
      double height, List<Appointment> appointments, Patient patient) {
    return Container(
      height: height * 0.5,
      child: TabBarView(
        controller: _controller, //to control the sync of tabs and views
        children: <Widget>[
          //separate widgets that holds contents respectively for both tabs
          LatestAppointmenContent(
              appointments: appointments
                  .where((test) => test.status == "latest")
                  .toList(),
              updateAppointment: updateAppointment),

          AppointmenContent((appointments
              .where((test) => test.status == "history")
              .toList())),

          PatientInfo(patient)
        ],
      ),
    );
  }
}
