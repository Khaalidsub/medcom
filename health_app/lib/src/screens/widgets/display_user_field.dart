import 'package:flutter/material.dart';

class DisplayUserField extends StatelessWidget {
  final String label;
  final String info;
  DisplayUserField({this.info, this.label});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        Text(
          info,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
