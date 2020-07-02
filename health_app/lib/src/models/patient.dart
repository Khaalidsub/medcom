import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/user.dart';

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

  //copy constructor
  Patient.copy(Patient from)
      : this(
            id: from.id,
            email: from.email,
            name: from.name,
            password: from.password,
            bloodType: from.bloodType,
            familyNumber: from.familyNumber,
            phoneNumber: from.phoneNumber,
            address: from.address,
            gender: from.gender,
            age: from.age,
            appointments: from.appointments);

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
      : super(email: snap.data['email'], type: snap.data['type']) {
    bloodType = snap.data['bloodType'];
    gender = snap.data['gender'];
    name = snap.data['name'];
    phoneNumber = snap.data['phone'];
    address = snap.data['address'];
    age = snap.data['age'];
    appointments = snap.data['appointments'];
    familyNumber = snap.data['familyPhone'];
    hospitals = snap.data['hospitals'] ?? [];
    id = snap.documentID;
  }

  toFirestore() {
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
      'hospitals': this.hospitals
    };
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
}
