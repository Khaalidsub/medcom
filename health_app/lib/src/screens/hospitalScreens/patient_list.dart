import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/screens/hospitalScreens/patient_appointment_list.dart';

//stateful because of deleting a patient functinality
class PatientList extends StatefulWidget {
  //class data

  List<Patient> patientList;

  PatientList(this.patientList);

  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppNav(
      //  appBar: AppBar(),
      //),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            addAutomaticKeepAlives: false,
            itemCount: widget.patientList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientDetails(
                            widget.patientList[index],
                          ), //TODO send the patient data here.
                        ),
                      );
                    }, //goes to patient full data page
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage('assets/images/ill.png'),
                    ),
                    title: Text(widget.patientList[index].name),
                    subtitle: Text(widget.patientList[index].age.toString()),
                    trailing: IconButton(
                      onPressed: null, //some crud operation on the data
                      icon: Icon(Icons.menu),
                    )),
              );
            }),
      ),
    );
  }
}
