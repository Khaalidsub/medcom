import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:date_format/date_format.dart';

class DatePicker extends StatelessWidget {
  final String label;
  final Future selectDate;
  final DateTime date;
  DatePicker({this.label, this.selectDate, this.date});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label),
        TextFormField(
          readOnly: true,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            labelText: formatDate(this.date, [dd, '-', mm, '-', yyyy]),
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 0, style: BorderStyle.none)),
            suffixIcon: IconButton(
                icon: Icon(FontAwesomeIcons.calendarWeek),
                onPressed: () => selectDate),
          ),
        ),
      ],
    );
  }
}
