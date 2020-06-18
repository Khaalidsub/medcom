import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/Appointement.dart';

class AppoitmentServiceProvider {
  final CollectionReference appointmentsCollection =
      Firestore.instance.collection('Appointments');
  String documentId;
  String doctorId;
  String patientId;
 AppoitmentServiceProvider ({this.documentId, this.doctorId, this.patientId});



 ///get the appoitment
  Stream<Appointment> get appointment {
    return appointmentsCollection
        .document(documentId)
        .snapshots()
        .map(_appointmentDataFromSnap);
  }

  
  ///get the doctors for a specific appoitments
  Stream<List<Appointment>> get doctors {
    return appointmentsCollection
        .where('doctorId', isEqualTo: doctorId)
        .snapshots()
        .map(_doctorListFromSnap);
  }

///get the patients for a specific appoitments
  Stream<List<Appointment>> get patient {
    return appointmentsCollection
        .where('patientId', isEqualTo: patientId)
        .snapshots()
        .map(_patientListFromSnap);
  }

///add appoitment to the firestore
  Future createAppoitment(Appointment appointment) async {
    final appRef = await appointmentsCollection.add({
      'date': appointment.date,
      'day': appointment.day,
      'description' : appointment.description,
      'diagnosis' : appointment.diagnosis,
      'doctorID' : doctorId,
      'ownerID ' : appointment.ownerId,
      'status' : appointment.status
    });
    return appRef.documentID;
  }

  ///
 //map it to an appoitment object
  Appointment _appointmentDataFromSnap(DocumentSnapshot snap) {
    Appointment appointment = new Appointment (
      date : snap.data['date'],
      day : snap.data['day'],
      description :snap.data['description'],
      diagnosis : snap.data['diagnosis'],
      doctorID : snap.data['doctorID'],
      ownerID : snap.data['ownerID'],
      status : snap.data['status'],
      documentId: snap.documentID,
    );
    return appointment ;
  }

  ///map a list of doctors
  List<Appointment> _doctorListFromSnap(QuerySnapshot snapshots) {
    return snapshots.documents.map(_appointmentDataFromSnap).toList();
  }
  ///map a list of patient
  List<Appointment> _patientListFromSnap(QuerySnapshot snapshots) {
    return snapshots.documents.map(_appointmentDataFromSnap).toList();
  }


}