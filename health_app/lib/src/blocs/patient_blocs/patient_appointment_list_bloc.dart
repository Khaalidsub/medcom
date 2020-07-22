import 'dart:async';
import 'package:health_app/src/models/Appointement.dart';

import 'package:health_app/src/services/repository.dart';
import 'package:health_app/src/blocs/stream_user_bloc.dart';

class AppointementListBloc extends StreamUserBloc {
  String patientId;

  Repository _repository =
      Repository<Appointment>(collection: 'appointment_list');
  //creating new stream stream controller

  Stream<List<Appointment>> get aListStream => _repository.getDocumentList(
      Appointment(), 'ownerID', patientId); // stream getter

  @override
  void dispose() async {
    await aListStream.drain();
    super.dispose();
  }
}
