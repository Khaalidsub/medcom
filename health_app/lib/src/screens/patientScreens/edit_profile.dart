import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';

class PatientEditProfile extends StatefulWidget {
  final Patient patient;
  PatientEditProfile(this.patient);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<PatientEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Edit Profile',
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: Material(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(30),
                  height: 200,
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      "assets/images/ill.png",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 5, 25, 25),
                  child: Wrap(
                    runSpacing: 20,
                    children: <Widget>[
                      Reusablefield(
                        label: "${widget.patient.name}",
                        color: Colors.white,
                        icon: Icon(Icons.phone),
                        type: TextInputType.phone,
                        hint: 'e.g +6011616178',
                      ),
                      Reusablefield(
                        label: "${widget.patient.address}",
                        color: Colors.white,
                        icon: Icon(Icons.phone),
                        type: TextInputType.phone,
                        hint: 'e.g +6011616178',
                      ),
                      Reusablefield(
                        label: "${widget.patient.phoneNumber}",
                        color: Colors.white,
                        icon: Icon(Icons.phone),
                        type: TextInputType.phone,
                        hint: 'e.g +6011838393',
                      ),
                      Reusablefield(
                        label: "${widget.patient.familyNumber ?? '+601103024'}",
                        color: Colors.white,
                        icon: Icon(Icons.phone),
                        type: TextInputType.phone,
                        hint: 'e.g +6011616178',
                      ),
                    ],
                  ),
                ),
                buildUpdateButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUpdateButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: RaisedButton(
        color: Colors.blueAccent,
        onPressed: () async {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        disabledColor: Colors.blueAccent,
        child: Text(
          "Update",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
