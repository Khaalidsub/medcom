import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/app.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';

class PatientDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppNav(
          appBar: AppBar(),
        ),
        body: ListView.builder(
            addAutomaticKeepAlives: false,
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                    onTap: () => {}, //goes to patient full data page
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
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
