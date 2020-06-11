import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/doctor.dart';

class DoctorServiceProvider {
  final CollectionReference doctorCollection =
      Firestore.instance.collection('doctor_list');
  String documentId;
  String hospitalId;
  DoctorServiceProvider({this.documentId, this.hospitalId});

  ///get the doctor
  Stream<Doctor> get doctor {
    return doctorCollection
        .document(documentId)
        .snapshots()
        .map(_doctorDataFromSnap);
  }

  ///get the doctors for a specific hospital
  Stream<List<Doctor>> get doctorList {
    return doctorCollection
        .where('hospitalId', isEqualTo: hospitalId)
        .snapshots()
        .map(_doctorListFromSnap);
  }

  ///add doctor to the firestore
  Future createDoctor(Doctor doctor) async {
    final docRef = await doctorCollection.add({
      'name': doctor.name,
      'specialization': doctor.specialization,
      'hospitalId': hospitalId
    });
    return docRef.documentID;
  }

  ///

  //map it to an doctor object
  Doctor _doctorDataFromSnap(DocumentSnapshot snap) {
    Doctor doctor = new Doctor(
      name: snap['name'],
      specialization: snap.data['specialization'],
      hospitalId: snap.data['hospitalId'],
      documentId: snap.documentID,
    );
    return doctor;
  }

  ///map a list of doctors
  List<Doctor> _doctorListFromSnap(QuerySnapshot snapshots) {
    return snapshots.documents.map(_doctorDataFromSnap).toList();
  }
}
