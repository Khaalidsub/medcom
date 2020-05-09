import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/input_field.dart';

class EditProfile extends StatefulWidget {
  final Patient patient;
  EditProfile(this.patient);
  final TextEditingController bloodtype = new TextEditingController();

  final TextEditingController familyNumber = new TextEditingController();

  final TextEditingController allergese = new TextEditingController();

  final TextEditingController phone = new TextEditingController();

  final TextEditingController password = new TextEditingController();

  final TextEditingController confirmPassword = new TextEditingController();
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
                        controller: widget.bloodtype,
                        label: "${widget.patient.bloodType}",
                        color: Colors.white,
                        icon: Icon(Icons.local_hospital),
                        hint: 'e.g A+',
                      ),
                      Reusablefield(
                        controller: widget.familyNumber,
                        label: "${widget.patient.familyNumber ?? '+601103024'}",
                        color: Colors.white,
                        icon: Icon(Icons.phone),
                        type: TextInputType.phone,
                        hint: 'e.g +6011616178',
                      ),
                      Reusablefield(
                        controller: widget.allergese,
                        label: "${widget.patient.alergese}",
                        color: Colors.white,
                        icon: Icon(FontAwesomeIcons.bookMedical),
                        hint: 'e.g Value, value, value',
                      ),
                      Reusablefield(
                        controller: widget.phone,
                        label: "${widget.patient.phoneNumber}",
                        color: Colors.white,
                        icon: Icon(Icons.phone),
                        type: TextInputType.phone,
                        hint: 'e.g +6011838393',
                      ),
                      Reusablefield(
                        controller: widget.password,
                        label: "${widget.patient.password}",
                        color: Colors.white,
                        icon: Icon(Icons.vpn_key),
                        isPass: true,
                        hint: 'e.g your password',
                      ),
                      Reusablefield(
                        controller: widget.confirmPassword,
                        label: "${widget.patient.password}",
                        color: Colors.white,
                        icon: Icon(Icons.vpn_key),
                        isPass: true,
                        hint: 'Rewrite Password Again',
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
        onPressed: () async {
          if (widget.password.text == widget.confirmPassword.text) {
            //do something here.
            if (widget.bloodtype.text.isEmpty)
              widget.bloodtype.text = widget.patient.bloodType;

            if (widget.familyNumber.text.isEmpty)
              widget.familyNumber.text = widget.patient.familyNumber;

            if (widget.allergese.text.isEmpty)
              widget.allergese.text = widget.patient.alergese;

            if (widget.password.text.isEmpty)
              widget.password.text = widget.patient.password;

            if (widget.phone.text.isEmpty)
              widget.phone.text = widget.patient.phoneNumber;

            this.widget.patient.bloodType = widget.bloodtype.text;

            this.widget.patient.familyNumber = widget.familyNumber.text;

            this.widget.patient.alergese = widget.allergese.text;

            this.widget.patient.password = widget.password.text;

            this.widget.patient.phoneNumber = widget.phone.text;

            await showDialog(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Success'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text("Details Have been added successfully!"),
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

            Navigator.pop(context,
                this.widget.patient); //sending back the updated data...
          } else {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Password Do not Match..'),
                backgroundColor: Colors.red));
          }
        },
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
