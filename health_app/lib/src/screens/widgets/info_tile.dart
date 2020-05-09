import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function callback;
  Tile({this.icon, this.label, this.callback});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: callback, //goes to patient full data page
        leading: icon,
        title: Text(this.label),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }
}
