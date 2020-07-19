import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/blocs/patient_blocs/patient_register_bloc.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/error_message.dart';
import 'package:health_app/src/screens/widgets/progress_bar.dart';
import 'package:health_app/src/screens/widgets/stream_input_field.dart';

class PatientReg extends StatefulWidget {
  @override
  _PatientRegState createState() => _PatientRegState();
}

class _PatientRegState extends State<PatientReg> {
  final PatientRegisterBloc _patientRegisterBloc =
      BlocProvider.getBloc<PatientRegisterBloc>();

  @override
  void dispose() {
    _patientRegisterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          //registration card
          appBar: AppNav(
            appBar: AppBar(),
            name: 'Register Patient',
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 180,
                  child: Icon(
                    FontAwesomeIcons.userPlus,
                    size: 80,
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 5, 25, 15),
                  child: Wrap(
                    runSpacing: 20,
                    children: <Widget>[
                      Reusablefield(
                        stream: _patientRegisterBloc.name,
                        onChangeFunction: _patientRegisterBloc.changeName,
                        label: "Enter Name",
                        color: Colors.white,
                        icon: Icon(Icons.local_hospital),
                        hint: 'e.g Will Smith',
                      ),
                      Reusablefield(
                        stream: _patientRegisterBloc.email,
                        onChangeFunction: _patientRegisterBloc.changeEmail,
                        label: "Enter Email",
                        color: Colors.white,
                        icon: Icon(Icons.mail),
                        type: TextInputType.emailAddress,
                        hint: 'e.g willsmith20@gmail.com',
                      ),
                      Reusablefield(
                        stream: _patientRegisterBloc.age,
                        onChangeFunction: _patientRegisterBloc.changeAge,
                        label: "Enter Age",
                        color: Colors.white,
                        icon: Icon(Icons.date_range),
                        type: TextInputType.number,
                        hint: 'e.g 18',
                      ),
                      Reusablefield(
                        stream: _patientRegisterBloc.phoneNumber,
                        onChangeFunction:
                            _patientRegisterBloc.changePhoneNumber,
                        label: "Enter Phone",
                        color: Colors.white,
                        icon: Icon(Icons.phone),
                        type: TextInputType.phone,
                        hint: 'e.g +6012xxxxxxxx',
                      ),
                      buildDropDownGender(),
                      buildDropDownBloodType(),
                      Reusablefield(
                        stream: _patientRegisterBloc.password,
                        onChangeFunction: _patientRegisterBloc.changePassword,
                        label: "Enter Password",
                        color: Colors.white,
                        icon: Icon(Icons.vpn_key),
                        isPass: true,
                        hint: 'e.g Will20@Smith',
                      ),
                      Reusablefield(
                        // controller: confirmPassword,
                        stream: _patientRegisterBloc.confirmPassword,
                        onChangeFunction:
                            _patientRegisterBloc.changeConfirmPassword,
                        label: "Confirm Password",
                        color: Colors.white,
                        icon: Icon(Icons.vpn_key),
                        isPass: true,
                        hint: 'Rewrite Password Again',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: buildRegisterButton(context),
                )
              ],
            ),
          )),
    );
  }

  StreamBuilder<Object> buildDropDownBloodType() {
    return StreamBuilder<Object>(
        stream: _patientRegisterBloc.bloodType,
        initialData: '',
        builder: (context, snapshot) {
          return DropDownFormField(
            titleText: 'BloodType',
            hintText: 'Please choose one',
            required: true,
            value: snapshot.data,
            onChanged: _patientRegisterBloc.changeBloodType,
            dataSource: [
              {"display": 'A-', "value": 'A-'},
              {"display": 'B+', "value": 'B+'},
              {"display": 'B-', "value": 'B-'},
              {"display": 'AB+', "value": 'AB+'},
              {"display": 'AB-', "value": 'AB-'},
              {"display": 'O+', "value": 'O+'},
              {"display": 'O-', "value": 'O-'},
            ],
            textField: 'display',
            valueField: 'value',
            errorText: snapshot.error,
          );
        });
  }

  StreamBuilder<Object> buildDropDownGender() {
    return StreamBuilder<Object>(
        stream: _patientRegisterBloc.gender,
        initialData: '',
        builder: (context, snapshot) {
          return DropDownFormField(
            titleText: 'Gender',
            hintText: 'Please choose one',
            required: true,
            value: snapshot.data,
            onChanged: _patientRegisterBloc.changeGender,
            dataSource: [
              {"display": 'Male', "value": 'M'},
              {"display": 'Female', "value": 'F'},
              {"display": 'Others', "value": 'O'},
            ],
            textField: 'display',
            valueField: 'value',
            errorText: snapshot.error,
          );
        });
  }

  Widget buildRegisterButton(BuildContext context) {
    return StreamBuilder<Object>(
        stream: _patientRegisterBloc.signInStatus,
        initialData: _patientRegisterBloc.showProgressBar(false),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data) {
              return ProgressBar();
            }

            return RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              color: Colors.blueAccent,
              child: Text(
                "Register",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onPressed: () {
                _patientRegisterBloc.showProgressBar(true);

                if (_patientRegisterBloc.validateSignUpFields())
                  authenticateUser(context);
                else {
                  ErrorMessage(context: context, input: 'wrong user fields')
                      .showErrorMessage();
                  _patientRegisterBloc.showProgressBar(false);
                }
              },
            );
          }
          return ProgressBar();
        });
  }

  void authenticateUser(BuildContext context) {
    _patientRegisterBloc.signUp().then((result) {
      print('result : ${result.id}');
      _patientRegisterBloc.showProgressBar(false);
      if (result.id == null) {
        // erro
        ErrorMessage(context: context, input: 'email/password is incorrect!')
            .showErrorMessage();
        _patientRegisterBloc.showProgressBar(false);
      }
      buildShowDialog(context);
    });
  }

  Future buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Patient Registeration'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Patient Register Was Successful. Please Login."),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/welcoming_screen');
              },
            ),
          ],
        );
      },
    );
  }
}
