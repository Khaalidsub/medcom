import 'package:flutter/material.dart';

class AppNav extends StatelessWidget implements PreferredSizeWidget {
  const AppNav({this.appBar});

  final AppBar appBar;

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      backgroundColor: Color(0xff3D73DD),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      titleSpacing: 40,
      title: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Expanded(
            //   child: Container(
            //     color: Color(0xff1D54BB),
            //     child: Image.asset('assets/images/logo.png'),
            //   ),
            // ),
            // Image.asset('assets/images/logo.png'),
            Expanded(
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(width: 0, color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 0.8, color: Colors.transparent),
                    ),
                    hintText: 'Search" ',
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                    suffixIcon:
                        IconButton(icon: Icon(Icons.clear), onPressed: () {}),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
