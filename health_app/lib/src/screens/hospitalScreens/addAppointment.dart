import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/screens/hospitalScreens/appointmentHistoryContent.dart';

class AddAppointment extends StatefulWidget {
  //class data
  String day, description;
  DateTime date;
  Patient
      data; //this will be given by the widget that calls this widget (as a copy data)

  AddAppointment(this.data);
  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  final _formkey = GlobalKey<FormState>();
  DateTime newDate = DateTime.now();

  void updateDay(String value) {
    setState(() {
      widget.day = value;
    });
  }

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
      print(selectedDate);
      setState(() {
        newDate = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            titleSpacing: 0,
          ),
          //registration card
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      "assets/images/logo-01.png",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Wrap(
                    runSpacing: 20,
                    children: <Widget>[
                      Reusablefield(
                        label: "Appointment Day",
                        color: Colors.white,
                        icon: Icon(Icons.view_day),
                        callback: this.updateDay,
                      ),
                      TextFormField(
                        readOnly: true,
                        onChanged: (val) {
                          setState(() {
                            newDate = DateTime.parse(val);
                          });
                        },
                        decoration: InputDecoration(
                            labelText: formatDate(
                                this.newDate, [dd, '-', mm, '-', yyyy]),
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    width: 0, style: BorderStyle.none)),
                            suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () {
                                  selectDate(context);
                                })),
                      ),
                      Reusablefield(
                        label: "Short description",
                        color: Colors.white,
                        icon: Icon(Icons.pages),
                        callback: this.updateDescription,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: RaisedButton(
                    onPressed: () {
                      //TODO: For now add this to users appointment list
                      Appointment newApp = new Appointment(newDate, widget.day,
                          widget.description, widget.data.id, "latest");
                      widget.data.appointments.add(newApp);
                      Navigator.pop(context, widget.data);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                    color: Colors.blueAccent,
                    //disabledColor: Colors.blueAccent,
                    child: Text(
                      "Add",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class Reusablefield extends StatelessWidget {
  final String label;
  final Color color;
  final Icon icon;
  final callback;
  Reusablefield(
      {@required this.label,
      @required this.color,
      @required this.icon,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (val) => val.isEmpty ? 'Please Enter a value' : null,
        onChanged: (val) => callback(val),
        decoration: InputDecoration(
          suffixIcon: icon,
          fillColor: color,
          filled: true,
          hintText: label,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 0, style: BorderStyle.none)),
        ));
  }
}
