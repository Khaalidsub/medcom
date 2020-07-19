import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/models/Appointement.dart';

class HospitalHistoryView extends StatelessWidget {
  final Appointment data;
  HospitalHistoryView(this.data);
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          height: 250,
          width: width * 0.45,
          child: Card(
            color: Color(0xff3D73DD),
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // Image.asset(data.imageUrl),
                      // Text(
                      //   '${data.name}',
                      //   style: TextStyle(
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white),
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${data.diagnosis}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: width * 0.44,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: width * 0.44,
                height: 250 * 0.45,
                child: Card(
                  color: Color(0xff3D73DD),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.userMd,
                        size: 35,
                        color: Colors.white,
                      ),
                      Text(
                        '${data.doctor.name}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: width * 0.44,
                height: 250 * 0.45,
                child: Card(
                  color: Color(0xff3D73DD),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      '${data.diagnosis}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
