import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';

class PatientDetailsBloc extends BlocBase {
  String id;
  Repository _repository = Repository();
  Stream<User> get patient {
    _repository.documentId = id;
    return _repository.getUserDocument;
  }

  Stream<List<Appointment>> get appointmentList {
    return _repository.getPatientAppointmentList(id);
  }

  @override
  void dispose() {
    patient.drain();
    super.dispose();
  }
}
