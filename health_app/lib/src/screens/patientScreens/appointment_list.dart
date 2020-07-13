import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/blocs/patient_blocs/patient_appointment_list_bloc.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/progress_bar.dart';

//stateful because of deleting a patient functinality
class AppointementList extends StatefulWidget {
  //class data
  final String patientId;
  AppointementList(this.patientId);
  @override
  _AppointementListState createState() => _AppointementListState();
}

class _AppointementListState extends State<AppointementList> {
  AppointementListBloc _appointementListBloc = BlocProvider.getBloc<AppointementListBloc>();
  @override
  void dispose() {
    _appointementListBloc.dispose();
    super.dispose();
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Appointement info",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center),
            content: Text(
              "${'context.diagnosis'}",
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
    _appointementListBloc.patientId = widget.patientId;
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Appointements',
      ),
      body: StreamBuilder<Object>(
          stream: _appointementListBloc.aListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //snapshots, so we make local variable
              List<dynamic> appointemnts = snapshot.data;

              return Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  addAutomaticKeepAlives: false,
                  itemCount: appointemnts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                          onTap: () { Navigator.pushNamed(
                              context,
                              '/patient/appointemnts_details',
                              arguments: appointemnts[index].id,
                            );}, //goes to appointment details if needed 
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage:
                                AssetImage('assets/images/ill.png'),
                          ),
                          title: Text(appointemnts[index].description),
                          subtitle: Text(appointemnts[index].date.toString()),
                          trailing: IconButton(
                            onPressed: () {
                              createAlertDialog(context);
                            }, //some crud operation on the data
                            icon: Icon(Icons.calendar_today),
                          )),
                    );
                  },
                ),
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
