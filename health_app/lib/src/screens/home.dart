import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/bottom_navigation.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'LATEST HOSPITALS',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber, width: 3),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    height: 250,
                    margin: EdgeInsets.only(left: 50, right: 50, bottom: 70),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ListView.builder(
                      itemCount: 5,
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return RaisedButton(
                          onPressed: () => null,
                          child: Text('Hospital $index'),
                          color: Colors.teal,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
