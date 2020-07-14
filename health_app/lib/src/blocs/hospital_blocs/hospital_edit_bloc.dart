import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class HospitalEditBloc extends BlocBase {
  final _repository = Repository();
  Stream<User> get streamUserData => _repository.userData.asStream();
  final _name = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _address = BehaviorSubject<String>();
  final _numOfBeds = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _isSubmit = BehaviorSubject<bool>.seeded(false);
   final _imageFile = BehaviorSubject<File>();
  //onChange
  Function(String) get changeName => _name.sink.add;
  Function(String) get changePhoneNumber => _phoneNumber.sink.add;
  Function(String) get changeNumOfBeds => _numOfBeds.sink.add;
  Function(String) get changeAddress => _address.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(bool) get showProgressBar => _isSubmit.sink.add;
  Function(File) get changeImage => _imageFile.sink.add;
  //streams
  Stream<String> get name => _name.stream;
  Stream<String> get phoneNumber => _phoneNumber.stream;
  Stream<String> get numOfBeds => _numOfBeds.stream;
  Stream<String> get address => _address.stream;
  Stream<String> get email => _email.stream;
  Stream<bool> get submitStatus => _isSubmit.stream;
 Stream<File> get imageFile => _imageFile.stream;

  Future<Hospital> editHospital(Hospital hospital) async {
    String image;
    if (_imageFile.hasValue) {
      image = await _repository.uploadImage(_imageFile.value);
    }
    //do wonders here
    hospital.name = _name.value ?? hospital.name;
    hospital.phoneNumber = _phoneNumber.value ?? hospital.phoneNumber;
    hospital.address = _address.value ?? hospital.address;
    hospital.email = _email.value ?? hospital.email;
    hospital.numOfBeds = _numOfBeds.value ?? hospital.numOfBeds;
    hospital.imageUrl = image ?? hospital.imageUrl;
    return await _repository.editHospital(hospital);
  }

  @override
  void dispose() async {
    await _address.drain();
    _address.close();
    await email.drain();
    _email.close();
    numOfBeds.drain();
    _numOfBeds.close();
    await _isSubmit.drain();
    _isSubmit.close();
    await _phoneNumber.drain();
    _phoneNumber.close();
    await _name.drain();
    _name.close();
     await _imageFile.drain();
    _imageFile.close();
    super.dispose();
  }
}
