import 'package:flutter/material.dart';

class AppNav extends StatelessWidget implements PreferredSizeWidget {
  const AppNav({this.appBar});

  final AppBar appBar;

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Image.asset('assets/images/logo.png'),
      backgroundColor: Color(0xffFFFEDE),
      title: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xffFFFEDE),
                    filled: true,
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(width: 0, color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
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
