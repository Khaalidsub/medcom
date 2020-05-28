import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/display_user_field.dart';
import '../../models/patient.dart';

class PatientProfile extends StatefulWidget {
  final Patient user;

  PatientProfile(this.user);

  @override
  _PatientProfileState createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Profile',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 50, right: 50, top: 6),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.pushNamed(
                      context, '/patient/settings',
                      arguments: widget.user),
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/ill.png'),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: Colors.blueAccent.withOpacity(.2), width: 1)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Name: ${widget.user?.name}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'ID: ${widget.user.id}'.substring(0, 15).toUpperCase(),
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    height: 12,
                    width: 22,
                    child: VerticalDivider(
                      width: 5,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Gender: ${widget.user?.gender}',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    height: 12,
                    width: 24,
                    child: VerticalDivider(
                      width: 5,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Age: ${widget.user?.age}',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Wrap(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  runSpacing: 30,
                  children: <Widget>[
                    DisplayUserField(
                      info: widget.user.bloodType,
                      label: 'Blood Type',
                    ),
                    DisplayUserField(
                      info: widget.user.familyNumber ?? '',
                      label: 'Emergency Number',
                    ),
                    DisplayUserField(
                      info: widget.user.phoneNumber,
                      label: 'Phone Number',
                    ),
                    DisplayUserField(
                      info: widget.user.address ?? '',
                      label: 'Address',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
