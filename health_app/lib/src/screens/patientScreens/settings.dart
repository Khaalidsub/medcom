import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';

class PatientSettings extends StatelessWidget {
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
                    backgroundImage: AssetImage('assets/images/ill.png'),
                  ),
                  title: Text("Muhammad adeen Rabbani"),
                  subtitle: Text("ID939204"),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Column(
                  children: <Widget>[
                    Tile(
                      icon: Icon(FontAwesomeIcons.user),
                      label: "My Profile",
                    ),
                    Tile(
                      icon: Icon(Icons.help),
                      label: "Help",
                    ),
                    Tile(
                      icon: Icon(FontAwesomeIcons.info),
                      label: "About",
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientSettings(),
                        ),
                      ),
                      child: Tile(
                        icon: Icon(FontAwesomeIcons.signOutAlt),
                        label: "Logout",
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

class Tile extends StatelessWidget {
  final Icon icon;
  final String label;

  Tile({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => {}, //goes to patient full data page
        leading: icon,
        title: Text(this.label),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }
}
