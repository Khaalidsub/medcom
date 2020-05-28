import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressBar extends StatelessWidget {
  Color color;
  ProgressBar({this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: SpinKitChasingDots(
        color: color ?? Colors.blueAccent,
        size: 30.0,
      ),
    ));
  }
}
