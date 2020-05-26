//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/patient.dart';

class UserServiceProvider {
  final CollectionReference userCollection =
      Firestore.instance.collection('User_List');

  //function that stores data i.e Reigstration to the firestore db
  Future createPatientData(Patient patient) async {
    return await userCollection.document(patient.id).setData({
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
  }
}
