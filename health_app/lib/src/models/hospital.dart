import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/user.dart';

final randomImage =
    'https://firebasestorage.googleapis.com/v0/b/utm-market.appspot.com/o/weirdo.jpg?alt=media&token=45473e1d-68a5-48b4-8262-a357d0c2f92d';

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
      : super(
            email: snap.data['email'],
            type: snap.data['type'],
            imageUrl: snap.data['image'] ?? randomImage) {
    address = snap.data['address'];
    dirName = snap.data['director'];
    phoneNumber = snap.data['phone'];
    id = snap.documentID;
    patients = snap.data['patients'] ?? [];
    doctors = snap.data['doctors'] ?? [];
    name = snap.data['name'];
    email = snap.data['email'];
  }
  toFireStore() {
    return {
      'name': this.name,
      'type': this.type,
      'phone': this.phoneNumber,
      'address': this.address,
      'director': this.dirName,
      'doctors': this.doctors,
      'patients': this.patients,
      'email': this.email,
      'image': this.imageUrl
    };
  }

  @override
  fromFireStore(DocumentSnapshot snapshot) {
    return Hospital.fromFirestore(snapshot);
  }
}
