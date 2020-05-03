import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/models/Appointement.dart';

class LatestAppointmenContent extends StatefulWidget {
  List<Appointment> data;
  LatestAppointmenContent(this.data);
  @override
  _LatestAppointmenContentState createState() =>
      _LatestAppointmenContentState();
}

class _LatestAppointmenContentState extends State<LatestAppointmenContent> {
  //final items = List<String>.generate(
  //    5, (i) => "Brain Cancer. Must be taken care of sensitive mdication$i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.data.length,
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
            child: Card(
              elevation: 10,
              color: Colors.white,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.calendarAlt),
                trailing: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed:
                        null), //on press shows a small action dialog, whatsapp for reference
                title: Row(
                  children: <Widget>[
                    Text(
                      widget.data[index].day + "  ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      formatDate(
                          widget.data[index].date, [dd, '-', mm, '-', yyyy]),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                subtitle: Text(widget.data[index].description),
              ),
            ),
          );
        });
  }
}
