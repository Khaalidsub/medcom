import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/Appointement.dart';

class AppoitmentServiceProvider {
  final CollectionReference appointmentsCollection =
      Firestore.instance.collection('Appointments');
  String documentId;
  String doctorId;
  String patientId;
  AppoitmentServiceProvider({this.documentId, this.doctorId, this.patientId});

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

  ///get the doctors for a specific appoitments
  Stream<List<Appointment>> get doctors {
    return appointmentsCollection
        .where('doctorId', isEqualTo: doctorId)
        .snapshots()
        .map(_doctorListFromSnap);
  }

  ///add appoitment to the firestore
  Future createAppoitment(Appointment appointment) async {
    final appRef =
        await appointmentsCollection.add(appointment.toFireStore(doctorId));
    return appRef.documentID;
  }

  //map it to an appoitment object
  Appointment _appointmentDataFromSnap(DocumentSnapshot snap) {
    Appointment appointment = new Appointment.fromFireStore(snap);

    return appointment;
  }

  ///map a list of doctors
  List<Appointment> _doctorListFromSnap(QuerySnapshot snapshots) {
    return snapshots.documents.map(_appointmentDataFromSnap).toList();
  }

  ///map a list of patient
  List<Appointment> _appointmentList(QuerySnapshot snapshots) {
    return snapshots.documents.map(_appointmentDataFromSnap).toList();
  }
}
