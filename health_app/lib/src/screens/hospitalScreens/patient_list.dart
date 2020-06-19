import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/blocs/patient_List_bloc.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/progress_bar.dart';

//stateful because of deleting a patient functinality
class PatientList extends StatefulWidget {
  //class data

  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  List<Patient> patients;
  PatientListBloc _patientListBloc = BlocProvider.getBloc<PatientListBloc>();
  @override
  void dispose() {
    _patientListBloc.dispose();
    super.dispose();
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Patient info",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center),
            content: Text(
              "Abdi, 18",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            actions: [
              FlatButton(
                child: Text("Ok",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            elevation: 24.0,
            backgroundColor: Colors.blueAccent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Patients',
      ),
      body: StreamBuilder<Object>(
          stream: _patientListBloc.pListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //snapshots, so we make local variable
              patients = snapshot.data;
              print(patients);
              return Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                    addAutomaticKeepAlives: false,
                    itemCount: patients.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                            onTap: () {
                              //need to be fixed
                              Navigator.pushNamed(
                                context,
                                '/hospital/patient_details',
                                arguments: 'QodzpSmCQiQGMY9058zQyBYtZKJ2',
                              );
                            }, //goes to patient full data page
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  AssetImage('assets/images/ill.png'),
                            ),
                            title: Text(patients[index].name),
                            subtitle: Text(patients[index].age.toString()),
                            trailing: IconButton(
                              onPressed: () {
                                createAlertDialog(context);
                              }, //some crud operation on the data
                              icon: Icon(Icons.menu),
                            )),
                      );
                    }),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ProgressBar(
                  color: Colors.blueAccent,
                ),
              ],
            );
          }),
    );
  }
}
