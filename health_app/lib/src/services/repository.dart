import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/models/firestoreConverter.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/DB/doctor_service_provider.dart';
import 'package:health_app/src/services/DB/appointment_service_provider.dart';
import 'package:health_app/src/services/DB/provider.dart';
import 'package:health_app/src/services/DB/user_service_provider.dart';
import 'package:health_app/src/services/auth_service_provider.dart';
import 'package:health_app/src/services/storage_service_provider.dart';

class Repository<T extends FireStoreConverter> {
  String documentId;
  final String collection;
  AuthServiceProvider _authServiceProvider;
  UserServiceProvider _userServiceProvider;
  AppoitmentServiceProvider _appoitmentServiceProvider;
  Provider _provider;
  Repository({this.documentId, @required this.collection});

  //check user session
  Stream<User> get userIsLoggedIn {
    _authServiceProvider = new AuthServiceProvider();
    return _authServiceProvider.user;
  }

  //get user data from database
  Future<User> get userData async {
    User userAuth = await userIsLoggedIn
        .first; //we check if there is already a user session
    if (userAuth != null) {
      _provider = UserServiceProvider(user: User(), documentId: userAuth.id);
      return _provider.document.first;
    }
    return null;
  }

  Stream<T> getDocument(T type) {
    _provider = Provider<T>(type, Firestore.instance.collection(collection),
        id: this.documentId);
    return _provider.document;
  }

  Stream<List<T>> getDocumentList(T type, String query, String queryId) {
    _provider = Provider<T>(
      type,
      Firestore.instance.collection(collection),
    );
    return _provider.documentList(query, queryId);
  }

  Stream<List<T>> getDocumentArrayContains(T type, String query, String id) {
    _provider = Provider<T>(type, Firestore.instance.collection(collection),
        whereId: query, id: id);
    return _provider.documentListArrayContains;
  }

  Future<T> editDocument(T type, String id) async {
    _provider =
        Provider<T>(type, Firestore.instance.collection(collection), id: id);
    try {
      await _provider.setData();
      return type;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<List<Appointment>> getAppointmentsByDay(String id, String date) {
    _appoitmentServiceProvider = AppoitmentServiceProvider(
        appointment: Appointment(), userId: id, date: date);
    return _appoitmentServiceProvider.appointmentsByDay;
  }

  Future<String> uploadImage(File image) async {
    return await StorgageService().uploadFile(image);
  }

  ///add a patient to the hospital
  Future addPatient(Hospital hospital, String patientEmail) async {
    _userServiceProvider =
        UserServiceProvider(user: User(), documentId: hospital.id);
    Patient patient = await _userServiceProvider.getUser(patientEmail);
    if (patient == null || patient.type != 'patient') {
      return null;
    }
    if (hospital.patients.contains(patient.id)) {
      return 'Patient has already been added!';
    }

    return await _userServiceProvider.addUserToHospital(hospital, patient);
  }

  ///add a doctor to the hospital
  Future addDoctor(Doctor doctor, Hospital hospital) async {
    try {
      //create a new doctor
      doctor.hospitalId = hospital.id;
      _provider = DoctorServiceProvider(doctor: doctor);
      // print(doctor.hospitalId);
      // String docId = await _doctorServiceProvider.createDoctor(doctor);
      final ref = await _provider.addDocument;
      String docId = ref.documentID;
      //get new doctor with the id;
      hospital.doctors.add(docId);
      _provider = Provider<Hospital>(
          hospital, Firestore.instance.collection('User_List'),
          id: hospital.id);
      await _provider.setData();
      return hospital;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // add appoitment
  Future addAppoitment(Appointment appointment, String patientEmail) async {
    _userServiceProvider = UserServiceProvider(user: User());

    try {
      Patient patient = await _userServiceProvider.getUser(patientEmail);
      appointment.status = 'latest';
      appointment.ownerID = patient.id;
      // _appoitmentServiceProvider = new AppoitmentServiceProvider();
      _provider = AppoitmentServiceProvider(appointment: appointment);
      //add appointment to firestore
      final ref = await _provider.addDocument;
      String appointmentId = ref.documentID;
      patient.appointments.add(appointmentId);
      //get the document id and store it to patient
      await _userServiceProvider.addAppointmentToUser(patient);
      return appointment;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<T> signUp(user) async {
    _authServiceProvider = new AuthServiceProvider();

    try {
      User result =
          await _authServiceProvider.signUp(user.email, user.password);
      user.id = result.id;
      _provider = Provider<T>(user, Firestore.instance.collection(collection),
          id: result.id);

      await _provider.setData();
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in
  Future<User> signIn(String email, String password) {
    _authServiceProvider = new AuthServiceProvider();
    return _authServiceProvider.signIn(email, password);
  }

  //logout
  Future signOut() async {
    try {
      _authServiceProvider = new AuthServiceProvider();
      await _authServiceProvider.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
