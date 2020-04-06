import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';

class Scan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 30),
                alignment: Alignment.center,
                width: width * 0.6,
                height: 250,
                color: Colors.white,
                child: Image(
                  image: AssetImage('assets/images/cameraIcon.png'),
                ),
              ),
              Text(
                "QR Code",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                alignment: Alignment.center,
                width: width * 0.8,
                height: 300,
                color: Colors.white,
                child: Image(
                  image: AssetImage('assets/images/qr.png'),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar:BottomNavigation() ,
    );
  }
}
