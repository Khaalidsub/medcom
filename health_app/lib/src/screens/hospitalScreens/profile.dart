import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/display_user_field.dart';

class HospitalProfile extends StatefulWidget {
  final Hospital user;
  HospitalProfile(this.user);

  @override
  _HospitalProfileState createState() => _HospitalProfileState();
}

class _HospitalProfileState extends State<HospitalProfile> {
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
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pushNamed(
                      context, '/hospital/settings',
                      arguments: widget.user),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CircleAvatar(
                  maxRadius: 50,
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(widget.user.imageUrl),
                ),
              ),
              Text(
                widget.user.name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
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
                    width: 24,
                    child: VerticalDivider(
                      width: 2,
                      color: Colors.black,
                    ),
                    //  onPressed: () => Navigator.pushNamed(context, '/settings'),
                  ),
                  Text(
                    'Patients: ${widget.user.patients?.length}',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Director: ${widget.user.dirName}',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    height: 12,
                    width: 24,
                    child: VerticalDivider(
                      width: 2,
                      color: Colors.black,
                    ),
                    //  onPressed: () => Navigator.pushNamed(context, '/settings'),
                  ),
                  Text(
                    'Email: ${widget.user.email.substring(0, 10)}',
                    overflow: TextOverflow.ellipsis,
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
                  runSpacing: 30,

                  // runAlignment: WrapAlignment.spaceBetween,
                  children: <Widget>[
                    DisplayUserField(
                      info: widget.user.address
                          .substring(0, widget.user.address.length ~/ 2),
                      label: 'Address',
                    ),
                    DisplayUserField(
                      info: widget.user.doctors.length.toString(),
                      label: 'Doctor Count',
                    ),
                    DisplayUserField(
                      info: widget.user.phoneNumber,
                      label: 'Phone Number',
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
