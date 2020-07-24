import 'dart:async';

import 'package:health_app/src/blocs/stream_user_bloc.dart';
import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/models/medicine.dart';
import 'package:rxdart/rxdart.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/services/repository.dart';

class AppointementEditeBloc extends StreamUserBloc {
  String hospitalId;
  String appointmentId;

  //stream appointment

  Stream<List<Doctor>> get streamDoctors =>
      Repository<Doctor>(collection: 'doctor_list')
          .getDocumentList(Doctor(), 'hospitalId', hospitalId);

  //sink stream
  final _diagnosis = BehaviorSubject<String>();
  final _doctor = BehaviorSubject<Doctor>();
  final _isedit = BehaviorSubject<bool>();
  final _medicines = BehaviorSubject<List<Medicine>>();

  //onChange
  Function(String) get changeDiagnosis => _diagnosis.sink.add;
  Function(List) get changeMedicine => _medicines.sink.add;
  Function(Doctor) get changeDoctor => _doctor.sink.add;
  Function(bool) get showeditStatus => _isedit.sink.add;

  //streams
  Stream<String> get diagnosis =>
      _diagnosis.stream.transform(_validateDiagnosis);
  Stream<bool> get editStatus => _isedit.stream;
  Stream<List<Medicine>> get medicines => _medicines.stream;
  Doctor get doctor => _doctor.value;
  //validators

  final _validateDiagnosis =
      StreamTransformer<String, String>.fromHandlers(handleData: (data, sink) {
    if (data.length > 5) {
      sink.add(data.trim());
    } else
      sink.addError('Not enough description');
  });

  bool validateFields() {
    if (_diagnosis.value.isNotEmpty || _doctor.value.name.isNotEmpty)
      return true;
    return false;
  }

  //edit function
  Future<Appointment> editAppointment() async {
    Repository _repo = Repository<Appointment>(
        collection: 'appointment_list', documentId: appointmentId);
    Appointment appointment = await _repo.getDocument(Appointment()).first;

    appointment.medicines = _medicines.value ?? [];
    appointment.diagnosis = _diagnosis.value;
    appointment.doctor = _doctor.value;
    appointment.hospitalId = this.hospitalId;
    appointment.status = 'history';

    // return await _repo.editappointement(appointment);
    return await _repo.editDocument(appointment, appointment.id);
  }

  @override
  void dispose() async {
    await _medicines.drain();
    _medicines.close();
    await _diagnosis.drain();
    _diagnosis.close();
    await _isedit.drain();
    _isedit.close();
    await _doctor.drain();
    _doctor.close();
    super.dispose();
  }
}
