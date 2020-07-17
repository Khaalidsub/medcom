import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';

class ScanPatientProfileBloc extends BlocBase {
  String id;

  Repository _repository = Repository();
  Stream<User> get streamPatient {
    _repository.documentId = id;
    return _repository.getUserDocument;
  }

  @override
  void dispose() {
    streamPatient.drain();

    super.dispose();
  }

  Future addPatient(User user, String patientEmail) {
    return _repository.addPatient(user, patientEmail);
  }
}
