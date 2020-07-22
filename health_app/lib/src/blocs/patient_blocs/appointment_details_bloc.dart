import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/services/repository.dart';

class AppointmentDetailsBloc extends BlocBase {
  String appointmentId;

  Repository _repository =
      Repository<Appointment>(collection: 'appointment_list');

  Stream<Appointment> get appointmentStream {
    _repository.documentId = appointmentId;
    return _repository.getDocument(Appointment());
    // return null;
  }

  @override
  void dispose() async {
    await appointmentStream.drain();
    super.dispose();
  }
}
