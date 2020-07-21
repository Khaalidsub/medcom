import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/services/generics_provider.dart';

class AppoitmentServiceProvider extends GenericsProvider<Appointment> {
  final CollectionReference appointmentsCollection =
      Firestore.instance.collection('Appointments');
  String documentId;
  String doctorId;
  String userId;
  String date;

  List<dynamic> appointmentIds;
  AppoitmentServiceProvider({
    Appointment appointment,
    String whereId,
    this.documentId,
    this.userId,
    this.appointmentIds,
    this.date,
  }) : super(appointment, Firestore.instance.collection('Appointments'),
            id: documentId, whereId: whereId);

  Stream<List<Appointment>> get appointmentsByDay {
    return appointmentsCollection
        .where('date', isEqualTo: this.date)
        .where('hospitalId', isEqualTo: userId)
        .where('status', isEqualTo: 'history')
        .snapshots()
        .map(super.list);
  }

  // Future updateAppointment(Appointment appointment) async {
  //   try {
  //     await _appointmentSetData(appointment);
  //     return appointment;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

}
