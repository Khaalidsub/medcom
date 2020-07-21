import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/firestoreConverter.dart';

class Doctor implements FireStoreConverter {
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

  Doctor.fromAppointment(DocumentSnapshot snap) {
    if (snap.data['doctor'] != null) {
      this.hospitalId = snap.data['doctor']['hospitalId'];
      this.name = snap.data['doctor']['name'];
      this.specialization = snap.data['doctor']['specialization'];
    }
  }

  @override
  fromFireStore(DocumentSnapshot snapshot) {
    return Doctor.fromFirestore(snapshot);
  }

  @override
  toFireStore() {
    return {
      'name': this.name,
      'specialization': this.specialization,
      'hospitalId': this.hospitalId
    };
  }
}
