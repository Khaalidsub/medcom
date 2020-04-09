import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/screens/hospitalScreens/appointmentHistoryContent.dart';
import 'package:health_app/src/screens/hospitalScreens/latestAppointementContent.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';

class PatientDetails extends StatefulWidget {
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    // double width = queryData.size.width;
    double height = queryData.size.height;
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: 15, bottom: 10), //test later with diff screen size
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/unknownPerson.jpg'),
              radius: 60,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              'Justin Bieber',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 3 * height / 100,
              ),
            ),
          ),
          RaisedButton(
            onPressed: null, //add appointment Functionality goes here!
            disabledColor: Colors.blue[600],
            child: FittedBox(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  Text(
                    'Add Appointment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: TabBar(
              indicatorColor: Colors.blueAccent,
              labelColor: Colors.black,
              controller: _controller,
              tabs: [
                Tab(
                  icon: const Icon(
                    FontAwesomeIcons.calendarCheck,
                    color: Colors.blueAccent,
                  ),
                  text: "Latest Appointments",
                ),
                Tab(
                  icon: const Icon(
                    FontAwesomeIcons.history,
                    color: Colors.blueAccent,
                  ),
                  text: 'History',
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              // height: 80.0,
              child: TabBarView(
                controller: _controller, //to control the sync of tabs and views
                children: <Widget>[
                  //separate widgets that holds contents respectively for both tabs
                  LatestAppointmenContent(),
                  AppointmenContent(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
