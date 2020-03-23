import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BottomNavigationBar(
    //   elevation: 10,
    //   type: BottomNavigationBarType.fixed,
    //   items: const <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.home),
    //       title: Text('Home'),
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.add),
    //       title: Text('Add'),
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.history),
    //       title: Text('History'),
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.linear_scale),
    //       title: Text('Scan'),
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.person),
    //       title: Text('Profile'),
    //     ),
    //   ],
    //   backgroundColor: Colors.white,
    //   currentIndex: 0,
    //   selectedItemColor: Color(0xff3D73DD),
    //   onTap: null,
    // );
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: CurvedNavigationBar(
        height: 50,
        items: <Widget>[
          Icon(
            Icons.home,
            color: Color(0xff3D73DD),
          ),
          Icon(
            Icons.add,
            color: Color(0xff3D73DD),
          ),
          Icon(
            Icons.history,
            color: Color(0xff3D73DD),
          ),
          Icon(
            Icons.linear_scale,
            color: Color(0xff3D73DD),
          ),
          Icon(
            Icons.person,
            color: Color(0xff3D73DD),
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color(0xff3D73DD),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
      ),
    );
  }
}
