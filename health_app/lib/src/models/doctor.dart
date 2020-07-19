import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  String name;
  String specialization;
  String hospitalId;
  String documentId;
  Doctor({this.name, this.specialization, this.hospitalId, this.documentId});

  Doctor.fromFirestore(DocumentSnapshot snap)
      : this(
          name: snap['name'],
          specialization: snap.data['specialization'],
          hospitalId: snap.data['hospitalId'],
          documentId: snap.documentID,
        );
  toFirestore() {
    return {
      'name': this.name,
      'specialization': this.specialization,
      'hospitalId': this.hospitalId
    };
  }

  Doctor.fromAppointment(DocumentSnapshot snap) {
    if (snap.data['doctor'] != null) {
      this.hospitalId = snap.data['doctor']['hospitalId'];
      this.name = snap.data['doctor']['name'];
      this.specialization = snap.data['doctor']['specialization'];
    }
  }
}
