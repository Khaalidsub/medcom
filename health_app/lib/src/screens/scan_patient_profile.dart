import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/blocs/scan_patient_profile_bloc.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/display_user_field.dart';
import 'package:health_app/src/screens/widgets/error_message.dart';
import 'package:health_app/src/screens/widgets/progress_bar.dart';

class ScanPatientProfile extends StatefulWidget {
  final patientId;
  final User user;
  ScanPatientProfile(this.patientId, this.user);

  @override
  _ScanPatientProfileState createState() => _ScanPatientProfileState();
}

class _ScanPatientProfileState extends State<ScanPatientProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Patient Profile',
      ),
      body: SingleChildScrollView(
        child: Consumer<ScanPatientProfileBloc>(builder: (context, scanBloc) {
          scanBloc.id = widget.patientId;
          return StreamBuilder<Object>(
              stream: scanBloc.streamPatient,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Patient patient = snapshot.data;
                  return Container(
                    padding: EdgeInsets.only(left: 50, right: 50, top: 6),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(patient.imageUrl),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: Colors.blueAccent.withOpacity(.2),
                                  width: 1)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Name: ${patient?.name}',
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
                              'ID: ${patient.id}'
                                  .substring(0, 10)
                                  .toUpperCase(),
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
                              'Gender: ${patient?.gender}',
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
                              'Age: ${patient?.age}',
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
                                info: patient.bloodType,
                                label: 'Blood Type',
                              ),
                              DisplayUserField(
                                info: patient.familyNumber ?? '',
                                label: 'Emergency Number',
                              ),
                              DisplayUserField(
                                info: patient.phoneNumber,
                                label: 'Phone Number',
                              ),
                              DisplayUserField(
                                info: patient.address ?? '',
                                label: 'Address',
                              ),
                            ],
                          ),
                        ),
                        // ignore: sdk_version_ui_as_code
                        if (widget.user.type == 'hospital')
                          Container(
                            margin: EdgeInsets.only(bottom: 15, top: 30),
                            child: RaisedButton(
                              onPressed: () async {
                                dynamic result = await scanBloc.addPatient(
                                    widget.user, patient.email);
                                if (result is String) {
                                  ErrorMessage(context: context, input: result)
                                      .showErrorMessage();
                                } else {
                                  ErrorMessage(
                                          context: context,
                                          input:
                                              'Patient has been successfully added')
                                      .showSuccessMessage();
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              color: Colors.blueAccent,
                              //disabledColor: Colors.blueAccent,
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }
                return Center(
                  child: ProgressBar(),
                );
              });
        }),
      ),
    );
  }
}
