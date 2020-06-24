import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/models/Appointement.dart';

class LatestAppointmenContent extends StatefulWidget {
  final Function updateAppointment;
  final List<Appointment> appointments;
  LatestAppointmenContent({this.appointments, this.updateAppointment});
  @override
  _LatestAppointmenContentState createState() =>
      _LatestAppointmenContentState();
}

class _LatestAppointmenContentState extends State<LatestAppointmenContent> {
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Appoinment",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center),
            content: Text(
              "General check up",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            actions: [
              FlatButton(
                child: Text("Ok",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            elevation: 24.0,
            backgroundColor: Colors.blueAccent,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.appointments.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            direction: DismissDirection.endToStart,
            confirmDismiss: null,
            key: UniqueKey(), //unique, Later have to change to id something
            background: Container(
              padding: EdgeInsets.only(right: 10),
              color: Colors.red[800],
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Delete Record",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            onDismissed: (direction) {
              //items.removeAt(index);
              //remove the items
              //also from the back end

              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: <Widget>[
                      Text("Record Deleted"),
                      IconButton(icon: Icon(Icons.undo), onPressed: null)
                    ],
                  ),
                ),
              );
            },
            child: GestureDetector(
              onLongPress: () => widget.updateAppointment(index),
              child: Card(
                elevation: 10,
                color: Colors.white,
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.calendarAlt),
                  trailing: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        createAlertDialog(context);
                      }), //on press shows a small action dialog, whatsapp for reference
                  title: Row(
                    children: <Widget>[
                      Text(
                        widget.appointments[index].day + "  ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        // formatDate(widget.appointments[index].date,
                        //     [dd, '-', mm, '-', yyyy]),
                        widget.appointments[index].date,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  subtitle: Text(widget.appointments[index].description),
                ),
              ),
            ),
          );
        });
  }
}
