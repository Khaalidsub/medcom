import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/blocs/hospital_navigation_bloc.dart';
import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/input_field.dart';

class AddScreen extends StatefulWidget {
  Hospital hospital;
  AddScreen(this.hospital);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final HospitalNavigationBloc _hospitalNavigationBloc =
      BlocProvider.getBloc<HospitalNavigationBloc>();

  @override
  void dispose() {
    // _hospitalNavigationBloc.dispose();
    super.dispose();
  }

  var _controller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String name, specialization;

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        buildPatient(),
        buildDoctor(),
      ],
    );
  }

  Widget buildDoctor() {
    return Scaffold(
        appBar: AppNav(
          appBar: AppBar(),
          name: 'Doctor',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                child: Icon(
                  FontAwesomeIcons.userMd,
                  size: 130,
                  color: Colors.blueAccent,
                ),
              ),
              Form(
                key: _formkey,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Wrap(runSpacing: 20, children: <Widget>[
                    Reusablefield(
                        label: "Name",
                        color: Colors.white,
                        icon: Icon(Icons.nature_people),
                        validate: (val) => val.isEmpty ? 'Enter a name' : null,
                        callback: (val) {
                          setState(() {
                            name = val;
                          });
                        }),
                    Reusablefield(
                        label: "Specialization",
                        color: Colors.white,
                        icon: Icon(Icons.tune),
                        validate: (val) =>
                            val.isEmpty ? 'Enter a Sepcialization' : null,
                        callback: (val) {
                          setState(() {
                            specialization = val;
                          });
                        }),
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: RaisedButton(
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      Doctor doctor = new Doctor(
                          name: this.name, specialization: this.specialization);
                      widget.hospital.addDoctor(doctor);

                      await buildShowDialog(context);
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  color: Colors.blueAccent,
                  //disabledColor: Colors.blueAccent,
                  child: Text(
                    "Add",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildPatient() {
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Add',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 120,
              child: Container(
                child: Icon(
                  FontAwesomeIcons.userAlt,
                  size: 100,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            buildPatientEmailField(),
            Divider(),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Patients',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 15, right: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Number of Patients',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '50',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Number of Appointments',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '60',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Number of Completed Appointments',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '60',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Want to add a doctor?',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 1),
              child: Text(
                'Swipe left',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPatientEmailField() {
    return StreamBuilder<Object>(
      stream: _hospitalNavigationBloc.email,
      builder: (context, snapshot) {
        return Container(
          height: 80,
          margin: const EdgeInsets.only(right: 20, left: 20),
          child: TextField(
            onChanged: _hospitalNavigationBloc.changeEmmail,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
              prefixIcon: Icon(
                Icons.account_box,
                size: 28.0,
              ),
              suffixIcon: IconButton(
                onPressed: () async {
                  await _hospitalNavigationBloc.addPatient(widget.hospital);
                },
                icon: Icon(Icons.add),
              ),
              hintText: "Enter Patient Email",
              errorText: snapshot.error,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        );
      },
    );
  }

  Future buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Details Have been adden successfully!"),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Alright'),
              onPressed: () {
                Navigator.of(context).pop(); //pop the dialog box
              },
            ),
          ],
        );
      },
    );
  }
}
