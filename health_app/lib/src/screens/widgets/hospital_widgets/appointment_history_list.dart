import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/models/Appointement.dart';

class AppointmenContent extends StatefulWidget {
  final List<Appointment> appointment;
  AppointmenContent(this.appointment);

  @override
  _AppointmenContentState createState() => _AppointmenContentState();
}

class _AppointmenContentState extends State<AppointmenContent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.appointment.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 10,
          color: Colors.white,
          child: ListTile(
            leading: Icon(FontAwesomeIcons.calendarAlt),
            trailing: IconButton(
                icon: Icon(Icons.menu),
                onPressed:
                    () {}), //on press shows a small action dialog, whatsapp for reference
            title: Row(
              children: <Widget>[
                Text(
                  widget.appointment[index].day + "  ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  // formatDate(
                  //     widget.data[index].date, [dd, '-', mm, '-', yyyy]),
                  widget.appointment[index].date,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                // Text('Doctor: ' +
                //     widget.appointment[index].doctor.name +
                //     '   '),
                Text('${widget.appointment[index].doctor.name}' + '     '),
                Text(widget.appointment[index].diagnosis),
              ],
            ),
          ),
        );
      },
    );
  }
}
