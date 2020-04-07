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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  addAutomaticKeepAlives: false,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        onTap: () => {}, //goes to patient full data page
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage('assets/images/ill.png'),
                        ),
                        title: Text("Muhammad adeen Rabbani"),
                        subtitle: Text("ID939204"),
                      ),
                    );
                  }),
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
                    Tile(
                      icon: Icon(FontAwesomeIcons.signOutAlt),
                      label: "Logout",
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
                    Icon(
                      Icons.copyright,
                      size: 20.0,
                    ),
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
