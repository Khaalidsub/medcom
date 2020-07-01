import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/user.dart';

class Hospital extends User {
  String phoneNumber;
  String address;
  String dirName;
  int numOfBeds;
  List<dynamic> doctors;
  List<dynamic> patients;
  Hospital(
      {String id,
      String email,
      String name,
      String password,
      this.dirName,
      this.numOfBeds,
      this.phoneNumber,
      this.address,
      this.doctors,
      this.patients})
      : super(
            id: id,
            email: email,
            name: name,
            type: 'hospital',
            password: password);

  Hospital.fromFirestore(DocumentSnapshot snap)
      : this(
          address: snap.data['address'],
          dirName: snap.data['director'],
          phoneNumber: snap.data['phone'],
          id: snap.documentID,
          patients: snap.data['patients'] ?? [],
          doctors: snap.data['doctors'] ?? [],
          name: snap.data['name'],
          email: snap.data['email'],
        );
  toFirestore() {
    return {
      'name': this.name,
      'type': this.type,
      'phone': this.phoneNumber,
      'address': this.address,
      'director': this.dirName,
      'doctors': this.doctors,
      'patients': this.patients,
      'email': this.email,
    };
  }
}
