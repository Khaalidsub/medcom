import 'package:flutter/material.dart';

class ErrorMessage {
  final String input;
  final BuildContext context;
  ErrorMessage({this.input, this.context});

  void showErrorMessage() {
    final snackbar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          input,
          style: TextStyle(color: Colors.white),
        ),
        duration: new Duration(seconds: 2));
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void showSuccessMessage() {
    final snackbar = SnackBar(
        backgroundColor: Colors.greenAccent,
        content: Text(
          input,
          style: TextStyle(color: Colors.white),
        ),
        duration: new Duration(seconds: 2));
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
