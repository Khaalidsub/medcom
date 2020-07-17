
import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class PatientHistoryBloc extends BlocBase {
  String patientId;
  final repository = Repository();
  final daySubject = BehaviorSubject<int>();
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  
  //expose the sink and stream of this controller.

  Stream<int> get dayStream => daySubject.stream;

  //exposing the sink

  StreamSink<int> get daySink => daySubject.sink;

  PatientHistoryBloc() {
    daySubject.stream.listen((streamvalue) => {this.day = streamvalue});
  }

  Stream<List<Appointment>> fetchAppointments() {
    final date =
        "2020-$month-$day"; 
    return this.repository.getAppointmentsByDayForPatient(this.patientId, date);
  }
}
