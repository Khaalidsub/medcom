import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';

class PatientEditProfileBloc extends BlocBase {
  Repository _repository = new Repository<Patient>(collection: 'User_List');
  //stream user
  Stream<User> get streamUserData => _repository.userData.asStream();
  //sink add objects
  final _name = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _address = BehaviorSubject<String>();
  final _familyNumber = BehaviorSubject<String>();
  final _isSubmit = BehaviorSubject<bool>();
  final _imageFile = BehaviorSubject<File>();
  //onChange
  Function(String) get changeName => _name.sink.add;
  Function(String) get changePhoneNumber => _phoneNumber.sink.add;
  Function(String) get changeFamilyNumber => _familyNumber.sink.add;
  Function(String) get changeAddress => _address.sink.add;
  Function(bool) get showProgressBar => _isSubmit.sink.add;
  Function(File) get changeImage => _imageFile.sink.add;
  //streams
  Stream<String> get name => _name.stream;
  Stream<String> get phoneNumber => _phoneNumber.stream;
  Stream<String> get familyNumber => _familyNumber.stream;
  Stream<String> get address => _address.stream;
  Stream<bool> get submitStatus => _isSubmit.stream;
  Stream<File> get imageFile => _imageFile.stream;

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
    String image;
    if (_imageFile.hasValue) {
      image = await _repository.uploadImage(_imageFile.value);
    }
    patient.address = _address.value ?? patient.address;
    patient.name = _name.value ?? patient.name;
    patient.familyNumber = _familyNumber.value ?? patient.familyNumber;
    patient.phoneNumber = _phoneNumber.value ?? patient.phoneNumber;
    patient.imageUrl = image ?? patient.imageUrl;
    // return await _repository.editPatient(patient);
    return _repository.editDocument(patient, patient.id);
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
    await _imageFile.drain();
    _imageFile.close();
    super.dispose();
  }
}
