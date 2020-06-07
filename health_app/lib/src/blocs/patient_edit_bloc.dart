import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';

class PatientEditProfileBloc extends BlocBase {
  Repository _repository = new Repository();
  //stream user
  Stream<User> get streamUserData => _repository.userData.asStream();
  //sink add objects
  final _name = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _address = BehaviorSubject<String>();
  final _familyNumber = BehaviorSubject<String>();
  final _isSubmit = BehaviorSubject<bool>();
  //onChange
  Function(String) get changeName => _name.sink.add;
  Function(String) get changePhoneNumber => _phoneNumber.sink.add;
  Function(String) get changeFamilyNumber => _familyNumber.sink.add;
  Function(String) get changeAddress => _address.sink.add;
  Function(bool) get showProgressBar => _isSubmit.sink.add;
  //streams
  Stream<String> get name => _name.stream;
  Stream<String> get phoneNumber => _phoneNumber.stream;
  Stream<String> get familyNumber => _familyNumber.stream;
  Stream<String> get address => _address.stream;
  Stream<bool> get submitStatus => _isSubmit.stream;

  //validators
  // bool validateFields() {
  //   if (_name.value.isNotEmpty ||
  //       _phoneNumber.value.isNotEmpty ||
  //       _address.value.isNotEmpty ||
  //       _familyNumber.value.isNotEmpty) return true;
  //   return false;
  // }

  //edit function
  Future<Patient> editProfile(Patient patient) async {
    patient.address = _address.value ?? patient.address;
    patient.name = _name.value ?? patient.name;
    patient.familyNumber = _familyNumber.value ?? patient.familyNumber;
    patient.phoneNumber = _phoneNumber.value ?? patient.phoneNumber;
    return await _repository.editPatient(patient);
  }

  @override
  void dispose() async {
    await _address.drain();
    _address.close();
    await _isSubmit.drain();
    _isSubmit.close();
    await _phoneNumber.drain();
    _phoneNumber.close();
    await _familyNumber.drain();
    _familyNumber.close();
    await _name.drain();
    _name.close();
    super.dispose();
  }
}
