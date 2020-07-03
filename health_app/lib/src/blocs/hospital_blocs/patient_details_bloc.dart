import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';

class PatientDetailsBloc extends BlocBase {
  String id;
  List<dynamic> appointmentIds;
  Repository _repository = Repository();
  Stream<User> get patient {
    _repository.documentId = id;
    return _repository.getUserDocument;
  }

  Stream<List<Appointment>> get appointmentList {
    if (appointmentIds.length != 0) {
      return _repository.getPatientAppointmentList(appointmentIds);
    }
    return null;
  }

  @override
  void dispose() {
    patient.drain();
    appointmentList.drain();
    super.dispose();
  }
}
