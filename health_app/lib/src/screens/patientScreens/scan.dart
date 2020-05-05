import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:qr_flutter/qr_flutter.dart';

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
                  child: RaisedButton(
                    onPressed: () async {
                      String cameraScanResult = await scanner.scan();
                      print(cameraScanResult); //Use this string to do wonders...
                    },
                    child: Text("Tap to Scan"),
                  )),
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
                child: QrImage(
                  data: "1234567890", //put here the User specific code to generate QR for each user.
                  version: QrVersions.auto,
                  size: 300.0,
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
