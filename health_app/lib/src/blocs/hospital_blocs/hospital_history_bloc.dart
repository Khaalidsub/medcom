//Get the month and date and fetch all appointments. to that date

import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class HospitalHistoryBloc extends BlocBase {
  String hospitalId;
  final repository = Repository();
  final monthSubject = BehaviorSubject<int>();
  final daySubject = BehaviorSubject<int>();

  //expose the sink and stream of this controller.

  Stream<int> get monthStream => monthSubject.stream;
  Stream<int> get dayStream => daySubject.stream;

  //exposing the sink
  StreamSink<int> get monthSink => monthSubject.sink;
  StreamSink<int> get daySink => daySubject.sink;

  Stream<List<Appointment>> fetchAppointments() {
    String m = monthSubject.value.toString();
    String d = daySubject.value.toString();
    if (monthSubject.hasValue && monthSubject.value < 10)
      m = monthSubject.value.toString().padLeft(2, '0');
    if (daySubject.hasValue && daySubject.value < 10)
      d = daySubject.value.toString().padLeft(2, '0');
    final date =
        "2020-$m-$d"; //If you found the year, please know that i was tired.

    return this
        .repository
        .getAppointmentsByDay('hospitalId', this.hospitalId, date);
  }

  @override
  void dispose() async {
    await monthSubject.drain();
    monthSubject.close();
    await daySubject.drain();
    daySubject.close();
    super.dispose();
  }
}
