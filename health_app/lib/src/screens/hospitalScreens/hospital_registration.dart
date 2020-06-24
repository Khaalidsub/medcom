import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/blocs/hospital_blocs/hospital_register_bloc.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/screens/widgets/error_message.dart';
import 'package:health_app/src/screens/widgets/progress_bar.dart';
import 'package:health_app/src/screens/widgets/stream_input_field.dart';

class HospRegistration extends StatefulWidget {
  @override
  _HospRegistration createState() => _HospRegistration();
}

class _HospRegistration extends State<HospRegistration> {
  final HospitalRegisterBloc _hospitalRegisterBloc =
      BlocProvider.getBloc<HospitalRegisterBloc>();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            appBar: AppNav(
              appBar: AppBar(),
              name: 'Register Hospital',
            ),
            body: Builder(
              builder: (context) => SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 200,
                      child: Hero(
                        tag: 'logo',
                        child: Image.asset(
                          "assets/images/logo-01.png",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Wrap(
                        runSpacing: 20,
                        children: <Widget>[
                          Reusablefield(
                            stream: _hospitalRegisterBloc.name,
                            onChangeFunction: _hospitalRegisterBloc.changeName,
                            label: "Enter Name",
                            color: Colors.white,
                            icon: Icon(FontAwesomeIcons.hospital),
                          ),
                          Reusablefield(
                            stream: _hospitalRegisterBloc.email,
                            onChangeFunction: _hospitalRegisterBloc.changeEmail,
                            label: "Enter Email",
                            color: Colors.white,
                            icon: Icon(Icons.mail),
                          ),
                          Reusablefield(
                            stream: _hospitalRegisterBloc.phoneNumber,
                            onChangeFunction:
                                _hospitalRegisterBloc.changePhoneNumber,
                            label: "Enter Phone",
                            color: Colors.white,
                            icon: Icon(Icons.phone),
                          ),
                          Reusablefield(
                            stream: _hospitalRegisterBloc.address,
                            onChangeFunction:
                                _hospitalRegisterBloc.changeAddress,
                            label: "Enter Address",
                            color: Colors.white,
                            icon: Icon(Icons.location_on),
                          ),
                          Reusablefield(
                            stream: _hospitalRegisterBloc.dirName,
                            onChangeFunction:
                                _hospitalRegisterBloc.changeDirName,
                            label: "Enter Director's Name",
                            color: Colors.white,
                            icon: Icon(Icons.supervised_user_circle),
                          ),
                          Reusablefield(
                            stream: _hospitalRegisterBloc.password,
                            onChangeFunction:
                                _hospitalRegisterBloc.changePassword,
                            label: "Enter Password",
                            color: Colors.white,
                            icon: Icon(Icons.vpn_key),
                            isPass: true,
                          ),
                          Reusablefield(
                            stream: _hospitalRegisterBloc.confirmPassword,
                            onChangeFunction:
                                _hospitalRegisterBloc.changeConfirmPassword,
                            label: "Confirm Password",
                            color: Colors.white,
                            icon: Icon(Icons.vpn_key),
                            isPass: true,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: buildRegistrationButton(context),
                    )
                  ],
                ),
              ),
            )));
  }

  Widget buildRegistrationButton(BuildContext context) {
    return StreamBuilder<Object>(
        stream: _hospitalRegisterBloc.signInStatus,
        initialData: _hospitalRegisterBloc.showProgressBar(false),
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
                _hospitalRegisterBloc.showProgressBar(true);

                if (_hospitalRegisterBloc.validateSignUpFields())
                  authenticateUser(context);
                else {
                  ErrorMessage(context: context, input: 'wrong user fields')
                      .showErrorMessage();
                  _hospitalRegisterBloc.showProgressBar(false);
                }
              },
            );
          }
          return ProgressBar();
        });
  }

  void authenticateUser(BuildContext context) {
    _hospitalRegisterBloc.signUp().then((result) {
      // print('result : ${result.id}');
      _hospitalRegisterBloc.showProgressBar(false);
      if (result == null) {
        // erro
        ErrorMessage(context: context, input: 'email/password is incorrect!')
            .showErrorMessage();
        _hospitalRegisterBloc.showProgressBar(false);
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
