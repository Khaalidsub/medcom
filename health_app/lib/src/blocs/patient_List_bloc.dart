import 'dart:async';

import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:health_app/src/blocs/stream_user_bloc.dart';
import 'package:rxdart/subjects.dart';

class PatientListBloc extends StreamUserBloc {
  Hospital hospital;

  Repository _repository = Repository();
  //creating new stream stream controller
  final patientListController = BehaviorSubject<List<Patient>>();
  Stream<List<Patient>> get pListStream =>
      patientListController.stream; // stream getter

  PatientListBloc() {
    _repository.userData.then((value) {
      this.hospital = value;
      print('hospital ${hospital.patients}');
      //if we have a hospital, then we fetch all the patients registered to it.
      _repository.getPatientList(hospital).then((patients) {
        print('here in list bloc : ${patients}');
        patientListController.add(patients);
      });
    });
  }
  //Stream<List<Patient>> get patientListStream {
  //  return _repository.getPatientList(hospital).asStream();
  //}
  @override
  void dispose() async {
    await patientListController.close();
    super.dispose();
  }
}
