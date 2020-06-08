import 'dart:async';

import 'package:health_app/src/blocs/stream_user_bloc.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class HospitalNavigationBloc extends StreamUserBloc {
  //input sink stream objects
  final _email = BehaviorSubject<String>();

  Function(String) get changeEmmail => _email.sink.add;

  Stream<String> get email => _email.stream.transform(_validateEmail);
  //validator functions
  final _validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email.trim());
    } else {
      sink.addError('Enter a proper email!');
    }
  });

  Future addPatient() async {
    return Repository();
  }

  @override
  void dispose() async {
    super.dispose();
    await _email.drain();
    _email.close();
  }
}
