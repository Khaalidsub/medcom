import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/blocs/hospital_blocs/hospital_settings_bloc.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/info_tile.dart';
import 'package:health_app/src/screens/widgets/progress_bar.dart';

class HospitalSettings extends StatefulWidget {
  final Hospital hospital;
  HospitalSettings(this.hospital);

  @override
  _HospitalSettingsState createState() => _HospitalSettingsState();
}

class _HospitalSettingsState extends State<HospitalSettings> {
  final HospitalSettingsBloc _hospitalSettingsBloc =
      BlocProvider.getBloc<HospitalSettingsBloc>();

  @override
  void dispose() {
    _hospitalSettingsBloc.dispose();
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
          stream: _hospitalSettingsBloc.streamUserData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Hospital hospital = snapshot.data;

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
                                AssetImage('assets/images/clin.png'),
                          ),
                          title: Text(hospital.name),
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
                                  context, '/hospital/edit_profile',
                                  arguments: widget.hospital),
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
                                  await _hospitalSettingsBloc.logout();
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/welcoming_screen',
                                      ModalRoute.withName('/hospital'));
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
