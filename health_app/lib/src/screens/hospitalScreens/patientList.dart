import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/screens/hospitalScreens/patientDetails.dart';

class PatientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppNav(
      //  appBar: AppBar(),
      //),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            addAutomaticKeepAlives: false,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientDetails(),
                        ),
                      );
                    }, //goes to patient full data page
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage('assets/images/ill.png'),
                    ),
                    title: Text("Muhammad adeen Rabbani"),
                    subtitle: Text("Age:"),
                    trailing: IconButton(
                      onPressed: null, //some crud operation on the data
                      icon: Icon(Icons.menu),
                    )),
              );
            }),
      ),
    );
  }
}
