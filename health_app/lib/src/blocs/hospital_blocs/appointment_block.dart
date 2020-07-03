import 'dart:async';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:health_app/src/blocs/stream_user_bloc.dart';

class AppointmentBloc extends StreamUserBloc {
  Repository _repository = new Repository();

  //sink and streams object
  final _day = BehaviorSubject<String>();
  final _date = BehaviorSubject<DateTime>();
  final _description = BehaviorSubject<String>();
  final _isAdded = BehaviorSubject<bool>();

  //onChanged Functions

  Function(String) get changeday => _day.sink.add;
  Function(DateTime) get changedate => _date.sink.add;
  Function(String) get changedescription => _description.sink.add;
  Function(bool) get showIfAdded => _isAdded.sink.add;

  //stream functions
  Stream<String> get day => _day.stream;
  Stream<DateTime> get date => _date.stream;
  Stream<String> get description =>
      _description.stream.transform(_validateDescription);
  Stream<bool> get ifaddedStatus => _isAdded.stream;

  //validators
  final _validateDescription = StreamTransformer<String, String>.fromHandlers(
      handleData: (description, sink) {
    if (description.length > 1) {
      sink.add(description.trim());
    } else
      sink.addError("Description should be written!");
  });

  bool validateFields() {
    if (_date.value != null &&
        _date.hasValue &&
        _day.value != null &&
        _day.hasValue &&
        _description.value != null &&
        _description.hasValue) {
      return true;
    } else
      return false;
  }

  //add appoinmte
  // ignore: missing_return
  Future<dynamic> addAppointment(String patientEmail) {
    // ignore: unused_local_variable
    Appointment appointment = new Appointment(
      day: _day.value,
      date: _date.value.toString().substring(0, 10),
      description: _description.value,
    );
    return _repository.addAppoitment(appointment, patientEmail);
  }

  @override
  void dispose() async {
    super.dispose();
    await _day.drain();
    _day.close();
    await _date.drain();
    _date.close();
    await _description.drain();
    _description.close();
    await _isAdded.drain();
    _isAdded.close();
  }
}
