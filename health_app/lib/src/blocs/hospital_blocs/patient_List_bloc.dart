import 'dart:async';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:health_app/src/blocs/stream_user_bloc.dart';
import 'package:rxdart/subjects.dart';

class PatientListBloc extends StreamUserBloc {
  String hospitalId;

  Repository _repository = Repository();
  //creating new stream stream controller

  Stream<List<User>> get pListStream =>
      _repository.getPatientList(this.hospitalId); // stream getter

  @override
  void dispose() async {
    await pListStream.drain();
    super.dispose();
  }
}
