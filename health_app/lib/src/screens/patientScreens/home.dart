import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/bottom_navigation.dart';
import 'package:health_app/src/screens/widgets/chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math.dart' as math;

class PatientHome extends StatelessWidget {
  Function changeIndex;
  int index;
  PatientHome({this.changeIndex, this.index});
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    double height = queryData.size.height;
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Notification',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => showDialogue(context),
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.29,
                      child: Card(
                        elevation: 10,
                        color: Color(0xff3D73DD),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.userMd,
                              color: Colors.white,
                              size: 50,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Appointments',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => showDialogue(context),
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.29,
                      child: Card(
                        elevation: 10,
                        color: Color(0xff3D73DD),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.hospital,
                              color: Colors.white,
                              size: 50,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Hospitals',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.29,
                      child: Card(
                        elevation: 10,
                        color: Color(0xff3D73DD),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.inbox,
                              color: Colors.white,
                              size: 50,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'updates',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Container(
              //   height: height * 0.10,
              //   width: width,
              //   child: Card(
              //     child: Text('alert'),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: height * 0.35,
                child: Charts(),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      bottomNavigationBar:
          BottomNavigation(changeIndex: changeIndex, index: index),
    );
  }

  Future showDialogue(BuildContext context) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (context, anim1, anim2) {},
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierLabel: '',
      transitionBuilder: (context, anim1, anim2, child) {
        return Transform.scale(
          scale: anim1.value,
          child: SimpleDialog(
            contentPadding: EdgeInsets.all(0),
            titlePadding: EdgeInsets.all(0),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            backgroundColor: Color(0xffFFFEDE),
            children: <Widget>[
              Container(
                height: 300,
                width: 500,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      color: Colors.yellow[200 * index],
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Image.asset('assets/images/clin.png'),
                            title: Center(
                              child: Text('Hospital ${index}'),
                            ),
                            trailing: Icon(FontAwesomeIcons.arrowDown),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 300),
    );
  }
}
