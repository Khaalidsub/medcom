import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/blocs/patient_settings_bloc.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/info_tile.dart';
import 'package:health_app/src/screens/widgets/progress_bar.dart';

class PatientSettings extends StatefulWidget {
  @override
  _PatientSettingsState createState() => _PatientSettingsState();
}

class _PatientSettingsState extends State<PatientSettings> {
  final PatientSettingsBloc _patientSettingsBloc =
      BlocProvider.getBloc<PatientSettingsBloc>();
  @override
  void dispose() {
    _patientSettingsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Settings',
      ),
      body: StreamBuilder<Object>(
          stream: _patientSettingsBloc.streamUserData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Patient patient = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30.0),
                      child: Card(
                        child: ListTile(
                          onTap: () => {}, //goes to patient full data page
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage:
                                AssetImage('assets/images/ill.png'),
                          ),
                          title: Text(patient.name),
                          subtitle: Text(patient.id.substring(0, 15)),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Column(
                          children: <Widget>[
                            Tile(
                              icon: Icon(FontAwesomeIcons.user),
                              label: "Edit Profile",
                              callback: () => Navigator.pushNamed(
                                  context, '/patient/edit_profile',
                                  arguments: patient),
                            ),
                            Tile(
                              icon: Icon(Icons.help),
                              label: "Help",
                            ),
                            Tile(
                              icon: Icon(FontAwesomeIcons.info),
                              label: "About",
                            ),
                            Tile(
                                icon: Icon(FontAwesomeIcons.signOutAlt),
                                label: "Logout",
                                callback: () async {
                                  await _patientSettingsBloc.logout();
                                  Navigator.pushReplacementNamed(
                                      context, '/welcoming_screen');
                                })
                          ],
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("from"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Medcom',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 25.0),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ProgressBar(
                  color: Colors.blueAccent,
                ),
              ],
            );
          }),
      // bottomNavigationBar:
      //       PatientBottomNavigation(changeIndex: ()=>{}, index: 1),
    );
  }
}
