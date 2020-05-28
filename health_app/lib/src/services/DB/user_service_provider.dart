//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';

class UserServiceProvider {
  final CollectionReference userCollection =
      Firestore.instance.collection('User_List');
  String documentId;
  UserServiceProvider({this.documentId});

  //user document  stream
  Stream<User> get userData {
    return userCollection
        .document(documentId)
        .snapshots()
        .map(_userDataFromSnap);
  }

  // user data from snap
  User _userDataFromSnap(DocumentSnapshot snap) {
    User user;
    if (snap.data['type'] == 'patient') {
      user = Patient(
        bloodType: snap.data['bloodType'],
        gender: snap.data['gender'],
        name: snap.data['name'],
        phoneNumber: snap.data['phone'],
        address: snap.data['address'],
        age: snap.data['age'],
        alergese: snap.data['alergese'],
        appointments: snap.data['appointments'],
        familyNumber: snap.data['familyPhone'],
        id: documentId,
      );
    } else if (snap.data['type'] == 'hospital') {
      user = Hospital(
        address: snap.data['address'],
        dirName: snap.data['director'],
        phoneNumber: snap.data['phone'],
        doctors: snap.data['doctors'],
        id: documentId,
        name: snap.data['name'],
        patients: snap.data['patient'],
      );
    } else
      throw new Error();
    user.type = snap.data['type'];
    return user;
  }

  //function that stores data i.e Reigstration to the firestore db
  Future createPatientData(Patient patient) async {
    await userCollection.document(patient.id).setData({
      'name': patient.name,
      'type': patient.type,
      'bloodType': patient.bloodType,
      // 'address': patient.address,
      // 'age': patient.age,
      // 'allergese': patient.alergese,
      'gender': patient.gender,
      'phone': patient.phoneNumber,
      // 'faimilyPhone': patient.familyNumber
    });
    return patient;
  }

  Future createHospitalData(Hospital hospital) async {
    await userCollection.document(hospital.id).setData({
      'name': hospital.name,
      'type': hospital.type,
      'phone': hospital.phoneNumber,
      'address': hospital.address,
      'director': hospital.dirName,
      //'beds': hospital.numOfBeds
      //'doctors': hospital.doctors
    });
    return hospital;
  }
}
