import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';

class AppointementEditeBloc extends BlocBase {
  Repository _repository = new Repository();
  //stream user
  Stream<User> get streamUserData => _repository.userData.asStream();
  //sink add objects
  final _day = BehaviorSubject<String>();
  final _date = BehaviorSubject<DateTime>();
  final _description = BehaviorSubject<String>();
  final _isedit = BehaviorSubject<bool>();
  //onChange
  Function(String) get changeday => _day.sink.add;
  Function(DateTime) get changedate => _date.sink.add;
  Function(String) get changedescription => _description.sink.add;
  Function(bool) get showeditStatus => _isedit.sink.add;
  //streams
  Stream<String> get day => _day.stream;
  Stream<DateTime> get date => _date.stream;
  Stream<String> get description => _description.stream;
  Stream<bool> get editStatus => _isedit.stream;

  //validators
  // bool validateFields() {
  //   if (_name.value.isNotEmpty ||
  //       _phoneNumber.value.isNotEmpty ||
  //       _address.value.isNotEmpty ||
  //       _familyNumber.value.isNotEmpty) return true;
  //   return false;
  // }

  //edit function
  Future<Appointment> editProfile(Appointment appointment) async {
    appointment.day = _day.value ?? appointment.day;
    appointment.description = _description.value ?? appointment.description;
    appointment.date = _date.value ?? appointment.date;
    
    return await _repository.editappointement(appointment);
  }

  @override
  void dispose() async {
    await _day.drain();
    _day.close();
    await _description.drain();
    _description.close();
    await _date.drain();
    _date.close();
    super.dispose();
  }
}