import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/DB/doctor_service_provider.dart';
import 'package:health_app/src/services/DB/appointment_service_provider.dart';
import 'package:health_app/src/services/DB/user_service_provider.dart';
import 'package:health_app/src/services/auth_service_provider.dart';
import 'package:health_app/src/services/generics_provider.dart';
import 'package:health_app/src/services/storage_service_provider.dart';

class Repository {
  String documentId;
  AuthServiceProvider _authServiceProvider;
  UserServiceProvider _userServiceProvider;
  AppoitmentServiceProvider _appoitmentServiceProvider;
  GenericsProvider _provider;
  Repository({this.documentId});

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

  //method gets the document based on the id given
  Stream<User> get getUserDocument {
    _provider =
        UserServiceProvider(user: new User(), documentId: this.documentId);
    return _provider.document;
  }

  Stream<List<Doctor>> getHospitalDoctorList(String hospitalId) {
    _provider = DoctorServiceProvider(
        doctor: Doctor(), documentId: hospitalId, whereId: 'hospitalId');
    return _provider.documentList('hospitalId', hospitalId);
  }

  Stream<List<Appointment>> getAppointmentsByDay(String id, String date) {
    _appoitmentServiceProvider = AppoitmentServiceProvider(
        appointment: Appointment(), userId: id, date: date);
    return _appoitmentServiceProvider.appointmentsByDay;
  }

  Stream<List<Appointment>> getAppointmentsByDayForPatient(
      String id, String date) {
    _appoitmentServiceProvider =
        AppoitmentServiceProvider(userId: id, date: date);
    return _appoitmentServiceProvider.appointmentsByDay;
  }

  Stream<List<Appointment>> getPatientAppointmentList(String id) {
    _provider = AppoitmentServiceProvider(
        appointment: Appointment(), documentId: id, whereId: 'ownerID');
    return _provider.documentList('ownerID', id);
  }

  Stream<Appointment> getAppointment(String appointmentId) {
    _provider = AppoitmentServiceProvider(
        appointment: Appointment(), documentId: appointmentId);

    return _provider.document;
  }

  //getting the patients List of the hospital
  Stream<List<User>> getPatientList(String hospitalId) {
    _provider = UserServiceProvider(
        user: User(), documentId: hospitalId, whereId: 'hospitals');
    return _provider.documentListArrayContains;
  }

  ///edit profile of patient
  Future<Patient> editPatient(Patient patient) async {
    _provider = GenericsProvider<Patient>(
        patient, Firestore.instance.collection('User_List'),
        id: patient.id);
    try {
      patient = await _provider.setData();
      return patient;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<String> uploadImage(File image) async {
    return await StorgageService().uploadFile(image);
  }

  Future<Hospital> editHospital(Hospital hospital) async {
    _provider = GenericsProvider<Hospital>(
        hospital, Firestore.instance.collection('User_List'),
        id: hospital.id);

    try {
      hospital = await _provider.setData();
      return hospital;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //! to be refactored
  ///edit profile of patient
  Future<Appointment> editappointement(Appointment appointment) async {
    _provider = AppoitmentServiceProvider(
        appointment: appointment, documentId: appointment.id);
    try {
      await _provider.setData();
      return appointment;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  ///add a patient to the hospital
  Future addPatient(Hospital hospital, String patientEmail) async {
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
      _provider = GenericsProvider<Hospital>(
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

  //sign in
  Future<User> signIn(String email, String password) {
    _authServiceProvider = new AuthServiceProvider();
    return _authServiceProvider.signIn(email, password);
  }

  //sign up by patient
  Future<Patient> signUpPatient(Patient patient) async {
    _authServiceProvider = new AuthServiceProvider();

    try {
      //go to authentication provider and return user for the id
      User result =
          await _authServiceProvider.signUp(patient.email, patient.password);
      patient.id = result.id;
      _provider = GenericsProvider<Patient>(
          patient, Firestore.instance.collection('User_List'),
          id: result.id);
      //create a user data for that specific patient and the document is the id from the authentication
      await _provider.setData();

      return patient;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign up by hospital
  Future<Hospital> singUpHospital(Hospital hospital) async {
    _authServiceProvider = new AuthServiceProvider();

    try {
      //go to authentication provider and return user for the id
      User result =
          await _authServiceProvider.signUp(hospital.email, hospital.password);
      hospital.id = result.id;

      _provider = GenericsProvider<Hospital>(
          hospital, Firestore.instance.collection('User_List'),
          id: result.id);

      //create a user data for that specific hospital and the document is the id from the authentication
      // hospital = await _userServiceProvider.createHospitalData(hospital);
      await _provider.setData();
      return hospital;
    } catch (e) {
      print(e.toString());
      return null;
    }
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
