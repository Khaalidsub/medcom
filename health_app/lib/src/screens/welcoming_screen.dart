import 'package:flutter/material.dart';

class WelcomingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double height = queryData.size.height;
    double width = queryData.size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/land.jpg"),
          fit: BoxFit.cover,
        )),
        child: Container(
          color: Colors.blueAccent.withOpacity(0.8),
          padding: EdgeInsets.only(left: 40.0, right: 40.0),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    // color: Colors.green,

                    height: 200,
                    child: Image.asset(
                      "assets/images/logo-01.png",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
