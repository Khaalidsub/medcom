import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class PatientHistoryBloc extends BlocBase {
  String patientId;
  final repository = Repository();
  final daySubject = BehaviorSubject<int>();
  final monthSubject = BehaviorSubject<int>();

  //expose the sink and stream of this controller.

  Stream<int> get dayStream => daySubject.stream;
  Stream<int> get monthStream => monthSubject.stream;

  //exposing the sink

  StreamSink<int> get daySink => daySubject.sink;
  StreamSink<int> get monthSink => monthSubject.sink;

  Stream<List<Appointment>> fetchAppointments() {
    String m = monthSubject.value.toString();
    String d = daySubject.value.toString();
    if (monthSubject.hasValue && monthSubject.value < 10)
      m = monthSubject.value.toString().padLeft(2, '0');
    if (daySubject.hasValue && daySubject.value < 10)
      d = daySubject.value.toString().padLeft(2, '0');
    final date = "2020-$m-$d";

    return this
        .repository
        .getAppointmentsByDay("ownerID", this.patientId, date);
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
