import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressBar extends StatelessWidget {
  Color color;
  ProgressBar({this.color});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(
          Duration(seconds: 20),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return Container(
                child: Center(
              child: SpinKitChasingDots(
                color: color ?? Colors.blueAccent,
                size: 30.0,
              ),
            ));
          }
          return Center(
            child: Text('Something went Wrong :('),
          );
        });
  }
}
