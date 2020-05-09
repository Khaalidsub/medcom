import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/screens/hospitalScreens/patient_appointment_list.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';

//stateful because of deleting a patient functinality
class PatientList extends StatefulWidget {
  //class data

  List patientList;

  PatientList(this.patientList);

  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
    createAlertDialog(BuildContext context){
    return showDialog(context: context,builder:(context){
      return AlertDialog(
        
        title: Text("Patient info",
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center),
        content: Text("Abdi, 18",
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,),
        actions: [
          FlatButton(
            
            child: Text("Ok",textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),
            onPressed: (){

              Navigator.of(context).pop();
            }
            ,)
          ,
        ],
        elevation: 24.0,
        backgroundColor: Colors.blueAccent,
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
        

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
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            addAutomaticKeepAlives: false,
            itemCount: widget.patientList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/patient_appointment_list',
                        arguments: widget.patientList[index],
                      );
                    }, //goes to patient full data page
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage('assets/images/ill.png'),
                    ),
                    title: Text(widget.patientList[index].name),
                    subtitle: Text(widget.patientList[index].age.toString()),
                    trailing: IconButton(
                      onPressed:  () {
                    createAlertDialog(context);
                  }, //some crud operation on the data
                      icon: Icon(Icons.menu),
                    )),
              );
            }),
      ),
    );
  }
}
