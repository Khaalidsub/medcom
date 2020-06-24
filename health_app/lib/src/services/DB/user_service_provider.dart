import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/models/Appointement.dart';

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
  Future<User> getUser(String email) async {
    try {
      List<User> user = await userCollection
          .where('email', isEqualTo: email)
          .snapshots()
          .map(_userListFromSnap)
          .first;

      return user.first;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //gets the user document
  Stream<User> getUserWithDocumentId(String documentId) {
    return userCollection
        .document(documentId)
        .snapshots()
        .map(_userDataFromSnap);
  }

  ///returns a list of users
  ///for one query snap shot,it returns one document snapshot
  ///hence i am re using our _userdata function
  List<User> _userListFromSnap(QuerySnapshot snap) {
    return snap.documents.map((snap) => _userDataFromSnap(snap)).toList();
  }

  // user data from snap
  User _userDataFromSnap(DocumentSnapshot snap) {
    User user;

    if (snap.data['type'] == 'patient') {
      user = Patient.fromFirestore(snap);
    } else if (snap.data['type'] == 'hospital') {
      user = Hospital.fromFirestore(snap);
    } else
      throw new Error();
    user.type = snap.data['type'];

    return user;
  }

  Future<List<User>> getPatientList(ids) async {
    List<Patient> users = [];
    for (int i = 0; i < ids.length; i++) {
      DocumentSnapshot snap = await userCollection.document(ids[i]).get();
      users.add(_userDataFromSnap(snap));
      print(snap.data['name']);
    }
    return users;
  }

  ///function that stores data i.e Reigstration to the firestore db
  Future createPatientData(Patient patient) async {
    await _patientSetData(patient);
    return patient;
  }

  Future createHospitalData(Hospital hospital) async {
    await _hospitalSetData(hospital);

    return hospital;
  }

  ///edit profile to update user data
  Future updatePatientData(Patient patient) async {
    try {
      await _patientSetData(patient);
      return patient;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//we make a funcig

  ///add patient to hospital
  Future<User> addUserToHospital(Hospital hospital, Patient patient) async {
    try {
      hospital.patients.add(patient.id);
      await _hospitalSetData(hospital);
      patient.hospitals.add(hospital.id);
      await updatePatientData(patient);

      return hospital;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  ///add doctor id to hospital
  Future addDoctorToHospital(Hospital hospital, String doctorId) async {
    try {
      hospital.doctors.add(doctorId);
      await _hospitalSetData(hospital);
      return hospital;
    } catch (e) {
      return null;
    }
  }

  // add appoitment to patient
  Future<Appointment> addAppointmentToUser(
      Appointment appointments, Patient patient) async {
    try {
      appointments.ownerId.add(patient.id);
      // await  _patientSetData(appointments);
      // appointments.patient.add(appointments.id);
      await updatePatientData(patient);

      return appointments;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  ///call this function whenever you want to change/create user data
  Future _patientSetData(Patient patient) async {
    await userCollection.document(patient.id).setData(patient.toFirestore());
  }

  Future _hospitalSetData(Hospital hospital) async {
    await userCollection.document(hospital.id).setData(hospital.toFirestore());
  }
}
