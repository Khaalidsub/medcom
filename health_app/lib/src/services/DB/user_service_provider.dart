import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/DB/provider.dart';

class UserServiceProvider extends Provider<User> {
  String documentId;
  UserServiceProvider({User user, this.documentId, String whereId})
      : super(user, Firestore.instance.collection('User_List'),
            id: documentId, whereId: whereId);

  //user document  stream

  //get patients from hospitals
  // Stream<List<User>> get patientList{
  //   return userCollection.snapshots()
  // }

  ///we return here one user
  ///for returninga user we have to use the where method and firebase does not know
  ///whether the returning data is one or a list of users
  ///the difference between this method and the normal method
  ///this one is returning a QUERY  snapshot whereby returning a list
  ///and the other is returning a document snapshot
  Future<User> getUser(String email, String type) async {
    try {
      List<User> users = await super
          .dataCollection
          .where('email', isEqualTo: email)
          .where('type', isEqualTo: type.toLowerCase())
          .snapshots()
          .map(super.list)
          .first;
      return users.first;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //gets the user documen
  ///returns a list of users
  ///for one query snap shot,it returns one document snapshot
  ///hence i am re using our _userdata function

  // user data from snap

  ///add patient to hospital
  Future<User> addUserToHospital(Hospital hospital, Patient patient) async {
    try {
      super.converter = hospital;
      super.id = hospital.id;
      hospital.patients.add(patient.id);
      await super.setData();
      patient.hospitals.add(hospital.id);
      super.converter = patient;
      super.id = patient.id;

      await super.setData();

      return hospital;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  ///add doctor id to hospital
  Future addDoctorToHospital(Hospital hospital) async {
    try {
      // await super.(hospital);
      await super.setData();
      return hospital;
    } catch (e) {
      return null;
    }
  }

  // add appoitment to patient
  Future<void> addAppointmentToUser(Patient patient) async {
    try {
      super.converter = patient;
      super.id = patient.id;
      await super.setData();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
