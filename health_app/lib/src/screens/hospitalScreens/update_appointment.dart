import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/models/medicine.dart';
import 'package:health_app/src/screens/hospitalScreens/add_medicine.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class UpdateAppointment extends StatefulWidget {
  Appointment appointment;
  UpdateAppointment(this.appointment);
  @override
  _UpdateAppointmentState createState() => _UpdateAppointmentState();
}

class _UpdateAppointmentState extends State<UpdateAppointment> {
  List<Medicine> medicines = new List();
  String _myActivity;
  void updateMedicine(Medicine med) {
    setState(() {
      medicines.add(med);
      widget.appointment.addMedicine(med);
    });
    print(medicines.length);
  }

  bool updateAppointment() {
    setState(() {
      widget.appointment.status = 'history';
    });

    return Navigator.pop(context, widget.appointment);
  }

  void updateDiagnosis(String diag) {
    print('hello ${Navigator.canPop(context)}');
    setState(() {
      widget.appointment.diagnosis = diag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 150,
              child: Icon(
                FontAwesomeIcons.diagnoses,
                size: 100,
                color: Colors.blueAccent,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                runSpacing: 15,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Medications :',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  buildMedicineList(),
                  buildAddMedicine(context),
                  Reusablefield(
                    label: "Diagnosis",
                    color: Colors.white,
                    icon: Icon(Icons.pages),
                    callback: this.updateDiagnosis,
                  ),
                  DropDownFormField(
                    titleText: 'Doctor',
                    hintText: 'Please choose one',
                    required: true,
                    value: _myActivity,
                    onChanged: (value) {
                      setState(() {
                        _myActivity = value;
                      });
                    },
                    dataSource: [
                      {
                        "display": "Running",
                        "value": "Running",
                      },
                      {
                        "display": "Climbing",
                        "value": "Climbing",
                      },
                    ],
                    textField: 'display',
                    valueField: 'value',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 175,
            child: FloatingActionButton(
              backgroundColor: Colors.blueAccent,
              heroTag: 'update',
              elevation: 2,
              onPressed: () => updateAppointment(),
              isExtended: true,
              child: Text(
                'Update',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          Container(
            width: 175,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey,
              heroTag: 'cacnel',
              elevation: 2,
              onPressed: () => Navigator.pop(null),
              isExtended: true,
              child: Text(
                'Cancel',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMedicineList() {
    return Card(
      child: ListView.builder(
        itemCount: medicines.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              medicines[index].name,
              style: TextStyle(fontSize: 18),
            ),
          );
        },
      ),
    );
  }

  Widget buildAddMedicine(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Colors.blueAccent,
        textColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () async {
          final data = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMedicine(),
            ),
          );
          if (data != null) {
            updateMedicine(data);
          }
        },
        child: Row(
          children: <Widget>[
            Icon(Icons.add),
            Text('Add new Medication'),
          ],
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  Function submit;
  String label;
  Color color;
  SubmitButton({this.submit, this.label, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      child: FloatingActionButton(
        backgroundColor: color,
        heroTag: 'appointment',
        elevation: 2,
        onPressed: () => submit,
        isExtended: true,
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}

class Reusablefield extends StatelessWidget {
  final String label;
  final Color color;
  final Icon icon;
  final callback;
  Reusablefield(
      {@required this.label,
      @required this.color,
      @required this.icon,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
