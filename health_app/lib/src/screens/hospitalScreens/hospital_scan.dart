import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/screens/scan_patient_profile.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:health_app/src/screens/widgets/app_nav.dart';

class ScanHospital extends StatelessWidget {
  final Hospital _hospital;
  ScanHospital(this._hospital);
  void _neverSatisfied(String details, context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ScanPatientProfile(details, _hospital)));
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
                "Scan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10, bottom: 30),
                  alignment: Alignment.center,
                  width: width * 0.6,
                  height: 250,
                  decoration: new BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: new BorderRadius.circular(40.0),
                  ),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    padding: const EdgeInsets.all(0.0),
                    highlightColor: Colors.blue,
                    color: Colors.lightBlueAccent,
                    child: Ink(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Icon(Icons.camera),
                    ),
                    onPressed: () async {
                      _neverSatisfied(await scanner.scan(), context);
                    },
                  )),
            ],
          ),
        ),
      ),
      // bottomNavigationBar:BottomNavigation() ,
    );
  }
}
