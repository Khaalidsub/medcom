import 'package:flutter/material.dart';

class AppNav extends StatelessWidget implements PreferredSizeWidget {
  const AppNav({this.appBar, this.name});
  final name;
  final AppBar appBar;

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      backgroundColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      titleSpacing: 20,
      title: Container(
        padding: EdgeInsets.all(5),
        child: Center(
          child: Text(
            name,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
