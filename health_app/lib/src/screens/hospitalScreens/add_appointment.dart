import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/blocs/hospital_blocs/appointment_block.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/error_message.dart';
import 'package:health_app/src/screens/widgets/input_field.dart';
import 'package:health_app/src/screens/widgets/progress_bar.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddAppointment extends StatefulWidget {
  final String email;

  AddAppointment(this.email);
  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  final AppointmentBloc _appointmentBloc =
      BlocProvider.getBloc<AppointmentBloc>();

  DateTime newDate = DateTime.now();

// to show the date dialog and get the appoinment date

  Future selectDate(context) async {
    DateTime selectedDate = await showDatePicker(
        initialDate: newDate,
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));

    _appointmentBloc.changedate(selectedDate);
    _appointmentBloc.changeday(DateFormat('EEEE').format(selectedDate));
  }

  @override
  void dispose() {
    _appointmentBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _appointmentBloc.changedate(newDate);
    _appointmentBloc.changeday(DateFormat('EEEE').format(newDate));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('email is ${widget.email}');
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Profile',
      ),
      body: StreamBuilder<Object>(
          stream: _appointmentBloc.streamUserData,
          // ignore: missing_return
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 200,
                    child: Hero(
                      tag: 'logo',
                      child: Icon(
                        FontAwesomeIcons.calendarCheck,
                        size: 125,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Wrap(
                      runSpacing: 20,
                      children: <Widget>[
                        buildDay(),
                        buildDatePicker(),
                        Reusablefield(
                          label: "Short description",
                          color: Colors.white,
                          icon: Icon(Icons.pages),
                          callback: _appointmentBloc.changedescription,
                        ),
                      ],
                    ),
                  ),
                  buildSubmitButton()
                ],
              ),
            );
          }),
    );
  }

  Widget buildSubmitButton() {
    return StreamBuilder<Object>(
      stream: _appointmentBloc.ifaddedStatus,
      initialData: _appointmentBloc.showIfAdded(false),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data) {
            return ProgressBar();
          }
          return Container(
            margin: EdgeInsets.only(bottom: 15, left: 40, right: 40),
            child: FloatingActionButton(
              heroTag: 'appointment',
              onPressed: () {
                _appointmentBloc.showIfAdded(true);
                if (_appointmentBloc.validateFields()) {
                  _appointmentBloc.showIfAdded(false);
                  _appointmentBloc.addAppointment(widget.email);
                  return Navigator.pop(context);
                } else {
                  _appointmentBloc.showIfAdded(false);
                  ErrorMessage(context: context, input: 'wrong user fields')
                      .showErrorMessage();
                }
              },
              isExtended: true,
              child: Text(
                'Add Appointment',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          );
        }
        return ProgressBar();
      },
    );
  }

  Widget buildDay() {
    return StreamBuilder<Object>(
        stream: _appointmentBloc.day,
        initialData: DateFormat('EEEE').format(newDate),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return TextFormField(
              readOnly: true,
              enabled: false,
              decoration: InputDecoration(
                labelText: snapshot.data,
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none)),
                suffixIcon: Icon(FontAwesomeIcons.calendarDay),
              ),
            );
          }
          return ProgressBar();
        });
  }

  Widget buildDatePicker() {
    return StreamBuilder<Object>(
        stream: _appointmentBloc.date,
        initialData: newDate,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: formatDate(snapshot.data, [dd, '-', mm, '-', yyyy]),
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none)),
                suffixIcon: IconButton(
                  icon: Icon(FontAwesomeIcons.calendarWeek),
                  onPressed: () {
                    selectDate(context);
                  },
                ),
              ),
            );
          }
          return ProgressBar();
        });
  }
}

//}
