import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/user.dart';

final randomImage =
    'https://firebasestorage.googleapis.com/v0/b/utm-market.appspot.com/o/weirdo.jpg?alt=media&token=45473e1d-68a5-48b4-8262-a357d0c2f92d';

class Patient extends User {
  String bloodType;
  String familyNumber;
  String phoneNumber;
  String address;
  String gender;
  String alergese;
  int age;
  List<dynamic> hospitals;
  //apointment List
  List<dynamic> appointments;

  Patient(
      {String id,
      String email,
      String name,
      String password,
      this.alergese,
      this.bloodType,
      this.familyNumber,
      this.phoneNumber,
      this.address,
      this.gender,
      this.age,
      this.hospitals,
      this.appointments})
      : super(
            id: id,
            email: email,
            name: name,
            type: 'patient',
            password: password);

  Patient.fromFirestore(DocumentSnapshot snap)
      : super(
            email: snap.data['email'],
            type: snap.data['type'],
            imageUrl: snap.data['image'] ?? randomImage) {
    bloodType = snap.data['bloodType'];
    gender = snap.data['gender'];
    name = snap.data['name'];
    phoneNumber = snap.data['phone'];
    address = snap.data['address'];
    age = snap.data['age'];
    appointments = snap.data['appointments'] ?? [];
    familyNumber = snap.data['familyPhone'];
    hospitals = snap.data['hospitals'] ?? [];
    id = snap.documentID;
  }

  String listAllData() {
    return "Name: ${this.name}\n" +
        "Age: ${this.age}\n" +
        "${this.appointments}\n" +
        "Blooad Type: ${this.bloodType}\n" +
        "Email: ${this.email}\n" +
        "Family: ${this.familyNumber}\n" +
        "Gender: ${this.gender}\n" +
        "Id: ${this.id}\n" +
        "Phone: ${this.phoneNumber}\n" +
        "Adress: ${this.address}\n";
  }

  @override
  fromFireStore(DocumentSnapshot snap) {
    this.email = snap.data['email'];
    this.type = snap.data['type'];
    this.imageUrl = snap.data['imageUrl'];
    this.bloodType = snap.data['bloodType'];
    this.gender = snap.data['gender'];
    this.name = snap.data['name'];
    this.phoneNumber = snap.data['phone'];
    this.address = snap.data['address'];
    this.age = snap.data['age'];
    this.appointments = snap.data['appointments'] ?? [];
    this.familyNumber = snap.data['familyPhone'];
    this.hospitals = snap.data['hospitals'] ?? [];
    this.id = snap.documentID;
  }

  @override
  toFireStore() {
    return {
      'type': this.type,
      'bloodType': this.bloodType,
      'name': this.name,
      'address': this.address,
      'age': this.age,
      'phone': this.phoneNumber,
      'faimilyPhone': this.familyNumber,
      'gender': this.gender,
      'appointments': this.appointments,
      'email': super.email,
      'hospitals': this.hospitals,
      'image': this.imageUrl
    };
  }
}
