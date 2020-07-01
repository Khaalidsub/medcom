import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:rxdart/rxdart.dart';




 class HospitalRegisterBloc extends BlocBase {
   Repository _repository = new Repository();

   static String pass;
  //sink and streams object
  final _email = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirm_password = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _address = BehaviorSubject<String>();
  final _dirName = BehaviorSubject<String>();
  final _isSignedIn = BehaviorSubject<bool>();

  //onChanged Functions
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changeName => _name.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeConfirmPassword => _confirm_password.sink.add;
  Function(String) get changeAddress => _address.sink.add;
  Function(String) get changeDirName => _dirName.sink.add;
  Function(String) get changePhoneNumber => _phoneNumber.sink.add;
  Function(bool) get showProgressBar => _isSignedIn.sink.add;


 //stream functions
  Stream<String> get email => _email.stream.transform(_validateEmail);
  Stream<String> get name => _name.stream;
  Stream<String> get password => _password.stream.transform(_validatePassword);
  Stream<String> get confirmPassword =>
      _confirm_password.stream.transform(_validatePassword);
  Stream<String> get address => _address.stream;
  Stream<String> get dirName => _dirName.stream;
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
  Future<Hospital> signUp() {
    Hospital hospital = new Hospital(
        name: _name.value,
        address: _address.value,
        dirName: _dirName.value,
        email: _email.value,
        password: _password.value,
        phoneNumber: _phoneNumber.value);

    return _repository.singUpHospital(hospital);
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
    await _confirm_password.drain();
    _confirm_password.close();
    await _phoneNumber.drain();
    _phoneNumber.close();
    await _dirName.drain();
    _dirName.close();
    await _address.drain();
    _address.close();
  }

 }

