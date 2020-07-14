import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/Appointement.dart';

class AppoitmentServiceProvider {
  final CollectionReference appointmentsCollection =
      Firestore.instance.collection('Appointments');
  String documentId;
  String doctorId;
  String patientId;
  String date;
  List<dynamic> appointmentIds;
  AppoitmentServiceProvider(
      {this.documentId,
      this.doctorId,
      this.patientId,
      this.appointmentIds,
      this.date});

  ///get the appoitment
  Stream<Appointment> get appointment {
    return appointmentsCollection
        .document(documentId)
        .snapshots()
        .map(_appointmentDataFromSnap);
  }

  Stream<List<Appointment>> get appointmentList {
    return appointmentsCollection
        .where('ownerID', isEqualTo: patientId)
        .snapshots()
        .map(_appointmentList);
  }

  Stream<List<Appointment>> get appointmentsByDay {
    return appointmentsCollection
        .where('date', isEqualTo: this.date)
        .snapshots()
        .map(_appointmentList);
  }

  ///add appoitment to the firestore
  Future createAppoitment(Appointment appointment) async {
    appointment.status = 'latest';

    final appRef = await appointmentsCollection.add(appointment.toFireStore());
    appointment.id = appRef.documentID;
    await appointmentsCollection
        .document(appRef.documentID)
        .setData(appointment.toFireStore());
    return appRef.documentID;
  }

  //map it to an appoitment object
  Appointment _appointmentDataFromSnap(DocumentSnapshot snap) {
    Appointment appointment = new Appointment.fromFireStore(snap);

    return appointment;
  }

  Future updateAppointment(Appointment appointment) async {
    try {
      await _appointmentSetData(appointment);
      return appointment;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future _appointmentSetData(Appointment appointment) async {
    await appointmentsCollection
        .document(appointment.id)
        .setData(appointment.toUpdateFirestore());
  }

  ///map a list of patient
  List<Appointment> _appointmentList(QuerySnapshot snapshots) {
    return snapshots.documents.map(_appointmentDataFromSnap).toList();
  }
}
