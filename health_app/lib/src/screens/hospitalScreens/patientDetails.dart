import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';

class PatientDetails extends StatefulWidget {
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  final items = List<String>.generate(
      10, (i) => "Brain Cancer. Must be taken care of sensitive mdication$i");

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    double height = queryData.size.height;
    return Material(
      child: Scaffold(
        appBar: AppNav(
          appBar: AppBar(),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: 15, bottom: 10), //test later with diff screen size
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/unknownPerson.jpg'),
                radius: 60,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text(
                'Justin Bieber',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 3 * height / 100,
                ),
              ),
            ),
            RaisedButton(
              onPressed: null, //add appointment Functionality goes here!
              disabledColor: Colors.blue[600],
              child: FittedBox(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    Text(
                      'Add Appointment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
            //*********************************************************************
            //this block of code might be set visible if everybody agrees to put
            //new appointments in the same screen
//**********************************************************************
            //Container(
            //  margin: EdgeInsets.only(top: 10, bottom: 5),
            //  child: Align(
            //    alignment: Alignment.centerLeft,
            //    child: Text(
            //      "New Appointments",
            //      style: TextStyle(
            //        fontWeight: FontWeight.bold,
            //        fontSize: 20,
            //      ),
            //    ),
            //  ),
            //),
            //Expanded(
            //  flex: 1,
            //  child: ListView.builder(
            //      itemCount: 0,
            //      itemBuilder: (BuildContext context, int index) {
            //        return Card(
            //          elevation: 10,
            //          color: Colors.white,
            //          child: ListTile(
            //            leading: Icon(FontAwesomeIcons.calendarAlt),
            //            trailing: IconButton(
            //                icon: Icon(Icons.menu),
            //                onPressed:
            //                    null), //on press shows a small action dialog, whatsapp for reference
            //            title: Text(
            //              "Sunday 2/10/1999",
            //              style: TextStyle(fontWeight: FontWeight.bold),
            //            ),
            //            subtitle: Text(
            //                "Brain tumor with internal bleeding. Must need home care and medicins need to be taken care of."),
            //          ),
            //        );
            //      }),
            //),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Appoinment History",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      confirmDismiss: null,
                      key: UniqueKey(), //unique shit
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
                        setState() {
                          items.removeAt(index);
                          //remove the items
                          //also from the back end
                        }

                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: <Widget>[
                                Text("Record Deleted"),
                                IconButton(
                                    icon: Icon(Icons.undo), onPressed: null)
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
                          title: Text(
                            "Sunday 2/10/2020",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(items[index]),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}