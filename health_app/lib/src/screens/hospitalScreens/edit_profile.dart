import 'package:flutter/material.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/input_field.dart';

class HospitalEditProfile extends StatefulWidget {
  final Hospital hospital;
  HospitalEditProfile(this.hospital);
  final TextEditingController phoneNumber = new TextEditingController();
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<HospitalEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Edit Profile',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30),
              height: 200,
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  "assets/images/buildingIcon.png",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 5, 25, 25),
              child: Wrap(
                runSpacing: 20,
                children: <Widget>[
                  Reusablefield(
                    controller: widget.phoneNumber,
                    label: "${widget.hospital.phoneNumber ?? '+601103024'}",
                    color: Colors.white,
                    icon: Icon(Icons.phone),
                    type: TextInputType.number,
                    hint: 'e.g +6011616178',
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 0),
              child: RaisedButton(
                color: Colors.blueAccent,
                onPressed: () async {
                  if (widget.phoneNumber.text.isEmpty)
                    widget.phoneNumber.text = widget.hospital.phoneNumber;
                  widget.hospital.phoneNumber = widget.phoneNumber.text;

                  await buildShowDialog(context);
                  Navigator.pop(context,
                      widget.hospital); //sending back the updated data...
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                disabledColor: Colors.blueAccent,
                child: Text(
                  "Update",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Details Have been adden successfully!"),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Alright'),
              onPressed: () {
                Navigator.of(context).pop(); //pop the dialog box
              },
            ),
          ],
        );
      },
    );
  }
}
