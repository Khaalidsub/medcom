import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/models/patient.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/input_field.dart';
import 'package:intl/intl.dart';

class AddAppointment extends StatefulWidget {
  //class data
  String day, description;
  DateTime date;
  final Patient
      patient; //this will be given by the widget that calls this widget (as a copy data)

  AddAppointment(this.patient);
  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  // final _formkey = GlobalKey<FormState>();
  DateTime newDate = DateTime.now();

  void updateDescription(String value) {
    setState(() {
      widget.description = value;
    });
  }
// to show the date dialog and get the appoinment date

  Future selectDate(context) async {
    DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: newDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));

    if (selectedDate != null && selectedDate != newDate) {
      setState(() {
        newDate = selectedDate;
        widget.day = DateFormat('EEEE').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppNav(
          appBar: AppBar(),
          name: 'Profile',
        ),
        body: SingleChildScrollView(
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
                    buildDatePicker(context),
                    Reusablefield(
                      label: "Short description",
                      color: Colors.white,
                      icon: Icon(Icons.pages),
                      callback: this.updateDescription,
                    ),
                  ],
                ),
              ),
              buildSubmitButton(context)
            ],
          ),
        ));
  }

  Widget buildSubmitButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15, left: 40, right: 40),
      child: FloatingActionButton(
        heroTag: 'appointment',
        onPressed: () {
          //     //TODO: For now add this to users appointment list
          Appointment newApp = new Appointment(
            date: newDate,
            day: widget.day ?? DateFormat('EEEE').format(newDate),
            description: widget.description,
            ownerId: widget.patient.id,
            status: "latest",
          );
          widget.patient.appointments.add(newApp);
          return Navigator.pop(context, widget.patient);
        },
        isExtended: true,
        child: Text(
          'Add Appointment',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  Widget buildDay() {
    return TextFormField(
      readOnly: true,
      enabled: false,
      decoration: InputDecoration(
        labelText: widget.day ?? DateFormat('EEEE').format(newDate),
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 0, style: BorderStyle.none)),
        suffixIcon: Icon(FontAwesomeIcons.calendarDay),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onChanged: (val) {
        setState(() {
          newDate = DateTime.parse(val);
        });
      },
      decoration: InputDecoration(
          labelText: formatDate(this.newDate, [dd, '-', mm, '-', yyyy]),
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 0, style: BorderStyle.none)),
          suffixIcon: IconButton(
              icon: Icon(FontAwesomeIcons.calendarWeek),
              onPressed: () {
                selectDate(context);
              })),
    );
  }
}