//Get the month and date and fetch all appointments. to that date

import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class HospitalHistoryBloc extends BlocBase {
  final repository = Repository();
  final monthSubject = BehaviorSubject<int>();
  final daySubject = BehaviorSubject<int>();
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  int year = DateTime.now().year;

  //expose the sink and stream of this controller.

  Stream<int> get monthStream => monthSubject.stream;
  Stream<int> get dayStream => daySubject.stream;

  //exposing the sink
  StreamSink<int> get monthSink => monthSubject.sink;
  StreamSink<int> get daySink => daySubject.sink;

  HospitalHistoryBloc() {
    monthSubject.stream.listen((streamValue) => {this.month = streamValue});
    daySubject.stream.listen((streamvalue) => {this.day = streamvalue});
  }

  Stream<List<Appointment>> fetchAppointments() {
    final date = "$year-$month-$day";
    return this.repository.getAppointmentsByDay(date);
  }
}
