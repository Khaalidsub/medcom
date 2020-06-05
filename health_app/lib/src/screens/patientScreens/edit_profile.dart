import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/blocs/patient_edit_bloc.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/progress_bar.dart';
import 'package:health_app/src/screens/widgets/stream_input_field.dart';

class PatientEditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<PatientEditProfile> {
  final PatientEditProfileBloc _editProfileBloc =
      BlocProvider.getBloc<PatientEditProfileBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Edit Profile',
      ),
      body: StreamBuilder<Object>(
          stream: _editProfileBloc.streamUserData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Patient patient = snapshot.data;
              return Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
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
                                onChangeFunction: _editProfileBloc.changeName,
                                stream: _editProfileBloc.name,
                                label: "${patient.name}",
                                color: Colors.white,
                                icon: Icon(Icons.phone),
                                type: TextInputType.phone,
                                hint: 'e.g +6011616178',
                              ),
                              Reusablefield(
                                onChangeFunction:
                                    _editProfileBloc.changeAddress,
                                stream: _editProfileBloc.address,
                                label: "${patient.address ?? 'address'}",
                                color: Colors.white,
                                icon: Icon(Icons.phone),
                                type: TextInputType.phone,
                                hint: 'e.g +6011616178',
                              ),
                              Reusablefield(
                                onChangeFunction:
                                    _editProfileBloc.changePhoneNumber,
                                stream: _editProfileBloc.phoneNumber,
                                label: "${patient.phoneNumber}",
                                color: Colors.white,
                                icon: Icon(Icons.phone),
                                type: TextInputType.phone,
                                hint: 'e.g +6011838393',
                              ),
                              Reusablefield(
                                onChangeFunction:
                                    _editProfileBloc.changeFamilyNumber,
                                stream: _editProfileBloc.familyNumber,
                                label:
                                    "${patient.familyNumber ?? '+601103024'}",
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
              );
            }
            return ProgressBar(
              color: Colors.blueAccent,
            );
          }),
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
