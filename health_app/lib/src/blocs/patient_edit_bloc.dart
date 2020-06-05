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

  //onChange
  Function(String) get changeName => _name.sink.add;
  Function(String) get changePhoneNumber => _phoneNumber.sink.add;
  Function(String) get changeFamilyNumber => _familyNumber.sink.add;
  Function(String) get changeAddress => _address.sink.add;

  //streams
  Stream<String> get name => _name.stream;
  Stream<String> get phoneNumber => _phoneNumber.stream;
  Stream<String> get familyNumber => _familyNumber.stream;
  Stream<String> get address => _address.stream;

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
    Patient editedPatient = Patient(
      address: _address.value.trim() ?? patient.address,
      name: _name.value.trim() ?? patient.name,
      phoneNumber: _phoneNumber.value.trim() ?? patient.phoneNumber,
      familyNumber: _familyNumber.value.trim() ?? patient.familyNumber,
    );
  }

  @override
  void dispose() async {
    await _address.drain();
    _address.close();
    await _phoneNumber.drain();
    _phoneNumber.close();
    await _familyNumber.drain();
    _familyNumber.close();
    await _name.drain();
    _name.close();
    super.dispose();
  }
}
