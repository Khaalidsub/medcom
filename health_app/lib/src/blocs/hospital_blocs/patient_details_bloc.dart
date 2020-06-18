import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';

class PatientDetailsBloc extends BlocBase {
  String id;
  Repository _repository;
  Stream<User> get patient {
    _repository = new Repository();
    return _repository.getUser(id);
  }

  @override
  void dispose() {
    patient.drain();
    super.dispose();
  }
}
