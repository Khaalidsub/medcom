import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase {
  Repository _repository = new Repository();
  //input sink stream objects
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _isSignedIn = BehaviorSubject<bool>();

  //onChanged Functions
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(bool) get showProgressBar => _isSignedIn.sink.add;
  //stream functions
  Stream<String> get email => _email.stream.transform(_validateEmail);
  Stream<String> get password => _password.stream.transform(_validatePassword);
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
      sink.add(password.trim());
    } else {
      sink.addError('password should be more than 5');
    }
  });

  bool validateSignInFields() {
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
  Future<User> signIn() {
    return _repository.signIn(_email.value.trim(), _password.value.trim());
  }

  //close streams and sinks after login
  @override
  void dispose() async {
    super.dispose();
    await _email.drain();
    _email.close();
    await _password.drain();
    _password.close();
  }
}
