import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Reusablefield extends StatelessWidget {
  final String label;
  final Color color;
  final bool isPass;
  final Icon icon;
  final TextInputType type;
  final String hint;
  final callback;
  Reusablefield(
      {@required this.label,
      @required this.color,
      @required this.icon,
      this.hint,
      this.isPass,
      this.callback,
      this.type});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: (val) => callback(val),
        keyboardType: type,
        inputFormatters: type == TextInputType.phone
            ? [
                WhitelistingTextInputFormatter(RegExp("[+0-9]")),
                LengthLimitingTextInputFormatter(13),
              ]
            : type == TextInputType.emailAddress
                ? [
                    WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9@._-]")),
                    LengthLimitingTextInputFormatter(50)
                  ]
                : null,
        obscureText: isPass == null ? false : isPass,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: icon,
          fillColor: color,
          filled: true,
          labelText: label,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 0, style: BorderStyle.none)),
        ));
  }
}
