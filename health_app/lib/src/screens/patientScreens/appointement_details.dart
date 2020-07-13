import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context ) {
    _appointmentDetailsBloc.patientId = widget.appointmentId;
    MediaQueryData queryData = MediaQuery.of(context);
    double height = queryData.size.height;
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Appointments',
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<Object>(
          stream: _appointmentDetailsBloc.aListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
                appointments = snapshot.data;
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Appoimtement",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 3 * height / 100,
                      ),
                    ),
                  ),
                  
                  StreamBuilder<Object>(
                    stream: _appointmentDetailsBloc.aListStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        appointments = snapshot.data;
                        var index = 1;              // here it should be the index of appointment provided after clicking on it
                        return buildFetchedAppointment(height,appointments, index);
                      }
                      return buildLoadingAppointment(height);
                    },
                  ),
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
          ProgressBar(
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }




  Container buildFetchedAppointment(
      double height, List<Appointment> appointments, int index) {
    return Container(
      height: height * 0.5,
                margin: EdgeInsets.only(top: 10),
                child: Wrap(  
                  runSpacing: 30,
                  children: <Widget>[
                    DisplayUserField(
                      info: appointments[index].date,
                      label: 'Date',
                    ),
                    DisplayUserField(
                      info: appointments[index].day,
                      label: 'Day',
                    ),
                    DisplayUserField(
                      info: appointments[index].diagnosis,
                      label: 'Diagnosis',
                    ),
                    DisplayUserField(
                      info: appointments[index].doctor.toString(),
                      label: 'Doctor',
                    ),
                  ],
              ),
     );
  }
}
