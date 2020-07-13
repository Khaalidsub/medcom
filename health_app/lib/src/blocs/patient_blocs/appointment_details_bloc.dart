import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/services/repository.dart';

class AppointmentDetailsBloc extends BlocBase {
  String patientId;

  Repository _repository = Repository();
  
 Stream<List<Appointment>> get aListStream =>
      _repository.getPatientAppointmentList(this.patientId);
    // return null;
  

  @override
 void dispose() async {
    await aListStream.drain();
    super.dispose();
  }
}
