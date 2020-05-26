import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class PatientRegisterBloc extends BlocBase {
  Repository _repository = new Repository();
  //sink and streams object
  final _email = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _bloodType = BehaviorSubject<String>();
  final _gender = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();

  //onChanged Functions
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changeName => _name.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeBloodType => _password.sink.add;
  Function(String) get changeGender => _password.sink.add;
  Function(String) get changePhoneNumber => _password.sink.add;

  //stream functions
  Stream<String> get email => _email.stream.transform(_validateEmail);
  Stream<String> get name => _name.stream;
  Stream<String> get password => _password.stream.transform(_validatePassword);
  Stream<String> get bloodType => _password.stream;
  Stream<String> get gender => _password.stream;
  Stream<String> get phoneNumber => _password.stream;

  //validator functions
  final _validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email.trim());
    } else {
      sink.addError('Enter a proper email!');
    }
  });

  final _validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 5) {
      sink.add(password.trim());
    } else {
      sink.addError('password should be more than 5');
    }
  });

  bool validateSignUpFields() {
    if (_email.value != null &&
        _email.value.isNotEmpty &&
        _password.value != null &&
        _password.value.isNotEmpty &&
        _email.value.contains('@') &&
        _password.value.length > 5) {
      return true;
    } else {
      return false;
    }
  }

  //sign in
  Future<User> signUp() {
    Patient patient = new Patient();

    return _repository.signUpPatient(patient);
  }

  @override
  void dispose() async {
    super.dispose();
    await _email.drain();
    _email.close();
    await _name.drain();
    _name.close();
    await _password.drain();
    _password.close();
    await _phoneNumber.drain();
    _phoneNumber.close();
    await _bloodType.drain();
    _bloodType.close();
    await _gender.drain();
    _gender.close();
  }
}
