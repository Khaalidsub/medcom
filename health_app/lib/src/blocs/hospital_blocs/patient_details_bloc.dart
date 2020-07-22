import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';

class PatientDetailsBloc extends BlocBase {
  String id;
  List<dynamic> appointmentIds;
  Repository _repository;
  Stream<User> get patient {
    _repository = Repository<User>(collection: 'User_List');
    _repository.documentId = id;
    return _repository.getDocument(User());
  }

  Stream<List<Appointment>> get appointmentList {
    _repository =
        Repository<Appointment>(collection: 'appointment_list', documentId: id);

    return _repository.getDocumentList(Appointment(), 'ownerID', id);
  }
}
