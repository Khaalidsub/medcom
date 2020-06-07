import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Reusablefield extends StatelessWidget {
  final String label;
  final Color color;
  final bool isPass;
  final Icon icon;
  final TextInputType type;
  final String hint;
  final onChangeFunction;
  final Stream stream;
  final String initialValue;
  Reusablefield({
    @required this.label,
    @required this.color,
    @required this.icon,
    @required this.stream,
    this.initialValue,
    this.hint,
    this.isPass,
    @required this.onChangeFunction,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: stream,
        builder: (context, snapshot) {
          return TextFormField(
              onChanged: onChangeFunction,
              keyboardType: type,
              inputFormatters: type == TextInputType.phone
                  ? [
                      WhitelistingTextInputFormatter(RegExp("[+0-9]")),
                      LengthLimitingTextInputFormatter(13),
                    ]
                  : type == TextInputType.emailAddress
                      ? [
                          WhitelistingTextInputFormatter(
                              RegExp("[a-zA-Z0-9@._-]")),
                          LengthLimitingTextInputFormatter(50)
                        ]
                      : null,
              obscureText: isPass == null ? false : isPass,
              initialValue: initialValue ?? '',
              decoration: InputDecoration(
                hintText: hint,
                suffixIcon: icon,
                fillColor: color,
                filled: true,
                labelText: label,
                errorText: snapshot.error,
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none)),
              ));
        });
  }
}
