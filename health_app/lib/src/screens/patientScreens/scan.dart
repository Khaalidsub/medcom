import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/screens/scan_patient_profile.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:qr_flutter/qr_flutter.dart';

class Scan extends StatelessWidget {
  final Patient user;
  Scan(this.user);

  void _neverSatisfied(String details, context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanPatientProfile(details,user)));
  
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Scan',
      ),
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
                  data: user.id
                      , //put here the User specific code to generate QR for each user.
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
