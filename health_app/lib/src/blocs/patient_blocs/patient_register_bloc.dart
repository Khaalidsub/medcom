import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class PatientRegisterBloc extends BlocBase {
  Repository _repository = new Repository<Patient>(collection: 'User_List');
  static String pass;
  //sink and streams object
  final _email = BehaviorSubject<String>();
  final _age = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();
  final _bloodType = BehaviorSubject<String>();
  final _gender = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _isSignedIn = BehaviorSubject<bool>();

  //onChanged Functions
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changeName => _name.sink.add;
  Function(String) get changeAge => _age.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeConfirmPassword => _confirmPassword.sink.add;
  Function(String) get changeBloodType => _bloodType.sink.add;
  Function(String) get changeGender => _gender.sink.add;
  Function(String) get changePhoneNumber => _phoneNumber.sink.add;
  Function(bool) get showProgressBar => _isSignedIn.sink.add;
  //stream functions
  Stream<String> get email => _email.stream.transform(_validateEmail);
  Stream<String> get name => _name.stream;
  Stream<String> get age => _age.stream;
  Stream<String> get password => _password.stream.transform(_validatePassword);
  Stream<String> get confirmPassword =>
      _confirmPassword.stream.transform(_validatePassword);
  Stream<String> get bloodType => _bloodType.stream;
  Stream<String> get gender => _gender.stream;
  Stream<String> get phoneNumber => _phoneNumber.stream;
  Stream<bool> get signInStatus => _isSignedIn.stream;
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
      pass = password.trim();
      sink.add(password.trim());
    } else {
      sink.addError('password should be more than 5');
    }
  });
  final _validateConfirmPassword =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) {
    if (password == pass) {
      sink.add(password.trim());
    } else {
      sink.addError('Password Is not the same!');
    }
  });

  bool validateSignUpFields() {
    print(_age.value);
    if (_email.value != null &&
        _email.value.isNotEmpty &&
        _age.value != null &&
        _age.value.isNotEmpty &&
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
  Future<Patient> signUp() {
    Patient patient = new Patient(
        name: _name.value,
        gender: _gender.value,
        bloodType: _bloodType.value,
        email: _email.value,
        password: _password.value,
        age: int.parse(_age.value),
        phoneNumber: _phoneNumber.value);

    // return _repository.signUpPatient(patient);
    return _repository.signUp(patient);
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
    await _confirmPassword.drain();
    _confirmPassword.close();
    await _phoneNumber.drain();
    _phoneNumber.close();
    await _bloodType.drain();
    _bloodType.close();
    await _gender.drain();
    _gender.close();
    await _age.drain();
    _age.close();
    await _isSignedIn.drain();
    _isSignedIn.close();
  }
}
