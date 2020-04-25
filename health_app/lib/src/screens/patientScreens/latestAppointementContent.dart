import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LatestAppointmenContent extends StatelessWidget {
  final items = List<String>.generate(
      1, (i) => "Brain Cancer. Must be taken care of sensitive mdication$i");
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
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
          
            child: Card(
              elevation: 10,
              color: Colors.white,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.calendarAlt),
                trailing: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed:
                        null), //on press shows a small action dialog, whatsapp for reference
                title: Text(
                  "Sunday 2/10/2020",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(items[index]),
              ),
            ),
          );
        });
  }
}
