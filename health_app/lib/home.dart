import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Text('hello'),
            Spacer(),
            Text('hello'),
            Spacer(),
            Text('hello'),
            Spacer(),
            Text('hello'),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
