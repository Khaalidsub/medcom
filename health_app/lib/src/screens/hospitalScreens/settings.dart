import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/screens/login.dart';
import 'package:health_app/src/screens/welcoming_screen.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/info_tile.dart';

class HospitalSettings extends StatelessWidget {
  final Hospital hospital;
  HospitalSettings(this.hospital);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Settings',
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Card(
                child: ListTile(
                  onTap: () => {}, //goes to patient full data page
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage('assets/images/clin.png'),
                  ),
                  title: Text("Hospital1"),
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
                          context, '/edit_profile',
                          arguments: hospital),
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
                      callback: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomingScreen(),
                        ),
                      ),
                    )
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
      ),
      // bottomNavigationBar:
      //       PatientBottomNavigation(changeIndex: ()=>{}, index: 1),
    );
  }
}
