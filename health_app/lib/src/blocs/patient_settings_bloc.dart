import 'package:health_app/src/blocs/stream_user_bloc.dart';
import 'package:health_app/src/services/repository.dart';

class PatientSettingsBloc extends StreamUserBloc {
  Future logout() async {
    await Repository().signOut();
  }
}
