import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/blocs/patient_edit_bloc.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/error_message.dart';
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
  void dispose() {
    _editProfileBloc.dispose();
    super.dispose();
  }

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
                                initialValue: patient.name,
                                onChangeFunction: _editProfileBloc.changeName,
                                stream: _editProfileBloc.name,
                                label: "Name",
                                color: Colors.white,
                                icon: Icon(FontAwesomeIcons.user),
                                type: TextInputType.text,
                                hint: 'Mohammed Adeen Rabbani',
                              ),
                              Reusablefield(
                                initialValue: patient.address,
                                onChangeFunction:
                                    _editProfileBloc.changeAddress,
                                stream: _editProfileBloc.address,
                                label: "Address",
                                color: Colors.white,
                                icon: Icon(FontAwesomeIcons.addressBook),
                                type: TextInputType.text,
                                hint: 'Taman Sri Pulai , Skudai',
                              ),
                              Reusablefield(
                                initialValue: patient.phoneNumber,
                                onChangeFunction:
                                    _editProfileBloc.changePhoneNumber,
                                stream: _editProfileBloc.phoneNumber,
                                label: "Phone Number",
                                color: Colors.white,
                                icon: Icon(FontAwesomeIcons.phoneAlt),
                                type: TextInputType.phone,
                                hint: 'e.g +6011838393',
                              ),
                              Reusablefield(
                                initialValue: patient.familyNumber,
                                onChangeFunction:
                                    _editProfileBloc.changeFamilyNumber,
                                stream: _editProfileBloc.familyNumber,
                                label: "Family Number",
                                color: Colors.white,
                                icon: Icon(FontAwesomeIcons.phone),
                                type: TextInputType.phone,
                                hint: 'e.g +6011616178',
                              ),
                            ],
                          ),
                        ),
                        buildUpdateButton(context, patient)
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

  Widget buildUpdateButton(BuildContext context, Patient patient) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: StreamBuilder<Object>(
          stream: _editProfileBloc.submitStatus,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data) {
                return ProgressBar();
              }
            }
            return RaisedButton(
              color: Colors.blueAccent,
              splashColor: Colors.blueAccent,
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
              onPressed: () async {
                _editProfileBloc.showProgressBar(true);
                authenticateUser(context, patient);
              },
            );
          }),
    );
  }

  void authenticateUser(BuildContext context, Patient patient) async {
    dynamic result = await _editProfileBloc.editProfile(patient);
    // print('result : ${result.id}');
    _editProfileBloc.showProgressBar(false);
    if (result == null) {
      // erro
      ErrorMessage(context: context, input: 'oops! something went wrong')
          .showErrorMessage();
      _editProfileBloc.showProgressBar(false);
    }
    ErrorMessage(
            context: context, input: 'Your Profile Has been succefully edited!')
        .showSuccessMessage();
    Navigator.popUntil(context, ModalRoute.withName('/patient'));
  }
}
