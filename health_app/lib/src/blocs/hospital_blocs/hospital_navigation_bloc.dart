import 'dart:async';

import 'package:health_app/src/blocs/stream_user_bloc.dart';
import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class HospitalNavigationBloc extends StreamUserBloc {
  //input sink stream objects
  final _email = BehaviorSubject<String>();
  final _doctorName = BehaviorSubject<String>();
  final _doctorSpecialization = BehaviorSubject<String>();
  Function(String) get changeEmmail => _email.sink.add;
  Function(String) get changeDoctorName => _doctorName.sink.add;
  Function(String) get changeDoctorSpecialization =>
      _doctorSpecialization.sink.add;

  Stream<String> get email => _email.stream.transform(_validateEmail);
  Stream<String> get doctorName => _doctorName.stream;
  Stream<String> get doctorSpecialization => _doctorSpecialization.stream;
  //validator functions
  final _validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email.trim());
    } else {
      sink.addError('Enter a proper email!');
    }
  });

  Future addPatient(Hospital hospital) {
    return Repository().addPatient(hospital, _email.value);
  }

  Future addDoctor(Hospital hospital) async {
    Doctor doctor = new Doctor(
        name: _doctorName.value, specialization: _doctorSpecialization.value);
    _doctorName.drain();
    _doctorSpecialization.drain();
    return Repository().addDoctor(doctor, hospital);
  }

  @override
  void dispose() async {
    super.dispose();
    await _email.drain();
    _email.close();
  }
}
