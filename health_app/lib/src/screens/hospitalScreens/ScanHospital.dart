import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;


class ScanHospital extends StatelessWidget {
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
               Text(
                "Scan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10, bottom: 30),
                  alignment: Alignment.center,
                  width: width * 0.6,
                  height: 250,
                  
                  decoration: new BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: new BorderRadius.circular(40.0),
                
              
                ),
                  
                  child: RaisedButton(
                    
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                     padding: const EdgeInsets.all(0.0),
                     highlightColor: Colors.blue,
                     color: Colors.lightBlueAccent,
                     child: Ink(
                      
                     decoration: const BoxDecoration(
                      
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                    ),
                    child: Icon(Icons.camera),
                    
                     ),
                    onPressed: () async {
                      String cameraScanResult = await scanner.scan();
                      print(cameraScanResult); //Use this string to do wonders...
                    },
                   
                  )),
             
             
            ],
          ),
        ),
      ),
      // bottomNavigationBar:BottomNavigation() ,
    );
  }
}