import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/models/patient.dart';

class PatientInfo extends StatelessWidget {
  final Patient user;
  PatientInfo(this.user);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'ID: ${user.id.substring(0, 10)}',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 12,
                child: VerticalDivider(
                  width: 2,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                'Gender: ${user.gender}',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 12,
                child: VerticalDivider(
                  width: 5,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                'Age: ${user.age ?? null}',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Blood Type',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              user.bloodType ?? null,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Emergancy Member',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              user.familyNumber ?? 'null',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              user.phoneNumber ?? null,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Address',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              user.address ?? 'null',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]))
        ],
      ),
    );
  }
}
