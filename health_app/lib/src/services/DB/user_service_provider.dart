//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/patient.dart';

class UserServiceProvider {
  final CollectionReference userCollection =
      Firestore.instance.collection('User_List');

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

  Future createHospitalData(Hospital hospital) async{
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
