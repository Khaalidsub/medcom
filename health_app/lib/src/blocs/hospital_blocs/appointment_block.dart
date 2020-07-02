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
  Stream<String> get description => _description.stream;
  Stream<bool> get ifaddedStatus => _isAdded.stream;

  //add appoinmte
  // ignore: missing_return
  Future<Appointment> addAppointment(String patientEmail) {
    // ignore: unused_local_variable
    Appointment appointment = new Appointment(
      day: _day.value,
      date: _date.value.toString(),
      description: _description.value,
    );
    _repository.addAppoitment(appointment, patientEmail);
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
