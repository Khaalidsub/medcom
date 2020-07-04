import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/blocs/hospital_blocs/update_appointment_block.dart';
import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/medicine.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/progress_bar.dart';
import 'package:health_app/src/screens/widgets/stream_input_field.dart';

class UpdateAppointment extends StatefulWidget {
  final String appointmentId;
  UpdateAppointment(this.appointmentId);
  @override
  _UpdateAppointmentState createState() => _UpdateAppointmentState();
}

class _UpdateAppointmentState extends State<UpdateAppointment> {
  final AppointementEditeBloc _appointmenteditBloc =
      BlocProvider.getBloc<AppointementEditeBloc>();
  List<Doctor> doctors;
  Hospital _hospital;
  List<Medicine> medicines = [];

  String doctor;
  void updateMedicine(Medicine med) {
    medicines.add(med);
    _appointmenteditBloc.changeMedicine(medicines);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Update Appointment',
      ),
      body: StreamBuilder<Object>(
        stream: _appointmenteditBloc.streamUserData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _hospital = snapshot.data;
            _appointmenteditBloc.hospitalId = _hospital.id;
            _appointmenteditBloc.appointmentId = widget.appointmentId;
            return SingleChildScrollView(
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
                          onChangeFunction:
                              _appointmenteditBloc.changeDiagnosis,
                          stream: _appointmenteditBloc.diagnosis,
                          label: "Diagnosis",
                          color: Colors.white,
                          icon: Icon(Icons.pages),
                        ),
                        buildDoctorDropDown(),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 175,
                          child: buildFloatingActionButton(context),
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
                  )
                ],
              ),
            );
          }
          return ProgressBar();
        },
      ),
    );
  }

  StreamBuilder<Object> buildDoctorDropDown() {
    return StreamBuilder<Object>(
        stream: _appointmenteditBloc.streamDoctors,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            doctors = snapshot.data;

            if (doctors.length != 0) {
              return DropDownFormField(
                titleText: 'Doctor',
                hintText: 'Please choose one',
                required: true,
                value: _appointmenteditBloc.doctor?.name,
                onChanged: (value) {
                  setState(() {});
                  return _appointmenteditBloc.changeDoctor(
                      doctors.firstWhere((doctor) => doctor.name == value));
                },
                dataSource: [
                  // ignore: sdk_version_ui_as_code
                  ...doctors.map((doctor) =>
                      {"display": doctor.name, "value": doctor.name})
                  // {"display": d1.name, "value": d1.name}
                ],
                textField: 'display',
                valueField: 'value',
              );
            }
          }
          return ProgressBar();
        });
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return StreamBuilder<Object>(
        stream: _appointmenteditBloc.showeditStatus(false),
        builder: (context, snapshot) {
          return FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            heroTag: 'update',
            elevation: 2,
            onPressed: () async {
              _appointmenteditBloc.showeditStatus(true);
              await _appointmenteditBloc.editAppointment();
              //  widget.appointment.add(newApp);
              // return Navigator.pop(context);
            },
            isExtended: true,
            child: Text(
              'Update',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          );
        });
  }

  Widget buildMedicineList() {
    return Card(
      child: StreamBuilder<Object>(
        stream: _appointmenteditBloc.medicines,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Medicine> medics = snapshot.data;
            return ListView.builder(
              itemCount: medics.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    medics[index].name,
                    style: TextStyle(fontSize: 18),
                  ),
                );
              },
            );
          }
          return Text('');
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
          final data =
              await Navigator.pushNamed(context, '/hospital/add_medicine');
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
