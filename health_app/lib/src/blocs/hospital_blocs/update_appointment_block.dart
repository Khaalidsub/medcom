import 'package:health_app/src/blocs/stream_user_bloc.dart';
import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/models/medicine.dart';
import 'package:rxdart/rxdart.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/services/repository.dart';

class AppointementEditeBloc extends StreamUserBloc {
  String hospitalId;
  String appointmentId;
  Repository _repository = new Repository();
  //stream appointment

  Stream<List<Doctor>> get streamDoctors =>
      _repository.getHospitalDoctorList(hospitalId);

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
  Stream<String> get diagnosis => _diagnosis.stream;
  Stream<bool> get editStatus => _isedit.stream;
  Stream<List<Medicine>> get medicines => _medicines.stream;
  Doctor get doctor => _doctor.value;
  //validators
  // bool validateFields() {
  //   if (_name.value.isNotEmpty ||
  //       _phoneNumber.value.isNotEmpty ||
  //       _address.value.isNotEmpty ||
  //       _familyNumber.value.isNotEmpty) return true;
  //   return false;
  // }

  //edit function
  Future<Appointment> editAppointment() async {
    Appointment appointment =
        await _repository.getAppointment(appointmentId).first
          ..medicines = _medicines.value
          ..diagnosis = _diagnosis.value
          ..doctor = _doctor.value
          ..status = 'history';

    return await _repository.editappointement(appointment);
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
