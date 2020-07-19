import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/blocs/patient_blocs/appointment_details_bloc.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/display_user_field.dart';
import 'package:health_app/src/screens/widgets/progress_bar.dart';

class AppointmentDetails extends StatefulWidget {
  final String appointmentId;
  AppointmentDetails(this.appointmentId);
  @override
  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails>
    with SingleTickerProviderStateMixin {
  final AppointmentDetailsBloc _appointmentDetailsBloc =
      BlocProvider.getBloc<AppointmentDetailsBloc>();

  List<Appointment> appointments;

  @override
  void dispose() {
    super.dispose();
    _appointmentDetailsBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _appointmentDetailsBloc.appointmentId = widget.appointmentId;
    MediaQueryData queryData = MediaQuery.of(context);
    double height = queryData.size.height;
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Appointment',
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<Object>(
          stream: _appointmentDetailsBloc.appointmentStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Appointment appointment = snapshot.data;
              return Column(
                children: <Widget>[
                  Container(
                    height: 180,
                    child: Icon(
                      FontAwesomeIcons.meetup,
                      size: 80,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Appointment Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 3 * height / 100,
                      ),
                    ),
                  ),
                  buildFetchedAppointment(height, appointment)
                ],
              );
            }
            return buildLoadingAppointment(height);
          },
        ),
      ),
    );
  }

  Container buildLoadingAppointment(double height) {
    return Container(
      //to control the sync of tabs and views
      child: Wrap(
        children: <Widget>[
          //separate widgets that holds contents respectively for both tabs
          ProgressBar(
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }

  Container buildFetchedAppointment(double height, Appointment appointment) {
    return Container(
      height: height * 0.5,
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Wrap(
        runSpacing: 30,
        children: <Widget>[
          DisplayUserField(
            info: appointment.date,
            label: 'Date',
          ),
          DisplayUserField(
            info: appointment.day,
            label: 'Day',
          ),
          DisplayUserField(
            info: appointment.description,
            label: 'Description',
          ),
          DisplayUserField(
            info: appointment.diagnosis,
            label: 'Diagnosis',
          ),
          DisplayUserField(
            info: appointment.doctor.name,
            label: 'Doctor',
          ),
        ],
      ),
    );
  }
}
