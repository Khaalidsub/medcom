import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/models/medicine.dart';
import 'package:intl/intl.dart';

class AddMedicine extends StatefulWidget {
  String name;
  String timesDaily;

  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  // final _formkey = GlobalKey<FormState>();
  DateTime dateStart = DateTime.now();
  DateTime dateEnd = DateTime.now();

  void updateName(String name) {
    setState(() {
      widget.name = name;
    });
  }

  void updateTimesDaily(String daily) {
    print(daily);
    setState(() {
      widget.timesDaily = daily;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                child: Hero(
                  tag: 'logo',
                  child: Icon(
                    FontAwesomeIcons.notesMedical,
                    size: 100,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Wrap(
                  runSpacing: 20,
                  children: <Widget>[
                    Reusablefield(
                      label: "Name",
                      color: Colors.white,
                      icon: Icon(Icons.pages),
                      callback: this.updateName,
                    ),
                    DatePicker(
                      date: dateStart,
                      label: 'Date Start :',
                    ),
                    DatePicker(
                      date: dateEnd,
                      label: 'Date End :',
                    ),
                    Reusablefield(
                      label: "Times Daily",
                      color: Colors.white,
                      icon: Icon(Icons.pages),
                      type: TextInputType.number,
                      callback: this.updateTimesDaily,
                    ),
                    buildSubmitButton(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSubmitButton(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        padding: EdgeInsets.all(15),
        color: Colors.blueAccent,
        textColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          Medicine medicine = new Medicine(
              name: widget.name,
              daily: widget.timesDaily,
              dateStart: dateStart,
              dateEnd: dateEnd);

          return Navigator.pop(context, medicine);
        },
        child: Text(
          'Add new Medication',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class DatePicker extends StatefulWidget {
  DateTime date;
  String label;
  DatePicker({this.date, this.label});

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  Future selectDate(context) async {
    DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: widget.date,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));

    if (selectedDate != null && selectedDate != widget.date) {
      setState(() {
        widget.date = selectedDate;
        // widget.day = DateFormat('EEEE').format(selectedDate);
      });
      // print('hellloo ${Navigator.canPop(context)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.label),
        TextFormField(
          readOnly: true,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            labelText: formatDate(this.widget.date, [dd, '-', mm, '-', yyyy]),
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 0, style: BorderStyle.none)),
            suffixIcon: IconButton(
              icon: Icon(FontAwesomeIcons.calendarWeek),
              onPressed: () {
                selectDate(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class Reusablefield extends StatelessWidget {
  final String label;
  final Color color;
  final TextInputType type;
  final Icon icon;
  final callback;
  Reusablefield(
      {@required this.label,
      @required this.color,
      @required this.icon,
      this.callback,
      this.type});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: type,
        validator: (val) => val.isEmpty ? 'Please Enter a value' : null,
        onChanged: (val) => callback(val),
        decoration: InputDecoration(
          suffixIcon: icon,
          fillColor: color,
          filled: true,
          hintText: label,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 0, style: BorderStyle.none)),
        ));
  }
}
