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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.appointments.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onLongPress: () => widget.updateAppointment(widget.appointments[index].id),
            child: Card(
              elevation: 10,
              color: Colors.white,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.calendarAlt),
                trailing: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      widget.updateAppointment(index);
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
          );
        });
  }
}
