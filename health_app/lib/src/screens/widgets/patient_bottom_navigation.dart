import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class PatientBottomNavigation extends StatelessWidget {
  final Function changeIndex;
  final int index;
  PatientBottomNavigation({this.changeIndex, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: CurvedNavigationBar(
        // key: PageKe,
        height: 50,
        items: <Widget>[
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.history,
            color: Colors.white,
          ),
          Icon(
            Icons.linear_scale,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
        color: Colors.blueAccent,
        buttonBackgroundColor: Colors.lightBlue,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (value) => changeIndex(value),
        index: index,
      ),
    );
  }
}
