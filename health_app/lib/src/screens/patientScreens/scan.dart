import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:qr_flutter/qr_flutter.dart';

class Scan extends StatelessWidget {
  //TODO require patient details
  Patient user;

  Scan(this.user);

  void _neverSatisfied(String details, context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Patient Details'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(details),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "QR Code",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                alignment: Alignment.center,
                width: width * 0.8,
                height: 300,
                color: Colors.white,
                child: QrImage(
                  data: user
                      .listAllData(), //put here the User specific code to generate QR for each user.
                  version: QrVersions.auto,
                  size: 300.0,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10, bottom: 30),
                  alignment: Alignment.center,
                  width: width * 0.6,
                  height: 250,
                  child: RaisedButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
                    textColor: Colors.white,
                    color: Colors.blueAccent,
                    onPressed: () async {
                      _neverSatisfied(await scanner.scan(), context);
                    },
                    child: Text(
                      "Tap to Scan",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ],
          ),
        ),
      ),
      // bottomNavigationBar:BottomNavigation() ,
    );
  }
}
