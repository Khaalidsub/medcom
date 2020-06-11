import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/DB/doctor_service_provider.dart';
import 'package:health_app/src/services/DB/user_service_provider.dart';
import 'package:health_app/src/services/auth_service_provider.dart';

class Repository {
  String documentId;

  Repository({this.documentId});

  AuthServiceProvider _authServiceProvider = new AuthServiceProvider();
  UserServiceProvider _userServiceProvider = new UserServiceProvider();
  DoctorServiceProvider _doctorServiceProvider;

  //check user session
  Stream<User> get user {
    _authServiceProvider = new AuthServiceProvider();
    return _authServiceProvider.user;
  }

  //get user data from database
  Future<User> get userData async {
    User userAuth = await user.first;
    if (userAuth != null) {
      _userServiceProvider = new UserServiceProvider(documentId: userAuth.id);
      return _userServiceProvider.userData.first;
    }
    return null;
  }

  //sign in
  Future<User> signIn(String email, String password) {
    return _authServiceProvider.signIn(email, password);
  }

  //sign up by patient
  Future<Patient> signUpPatient(Patient patient) async {
    try {
      //go to authentication provider and return user for the id
      User result =
          await _authServiceProvider.signUp(patient.email, patient.password);
      patient.id = result.id;
      //create a user data for that specific patient and the document is the id from the authentication
      patient = await _userServiceProvider.createPatientData(patient);

      return patient;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  ///edit profile
  Future<Patient> editPatient(Patient patient) async {
    try {
      patient = await _userServiceProvider.updatePatientData(patient);
      print(patient.name);
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
      //create a user data for that specific hospital and the document is the id from the authentication
      hospital = await _userServiceProvider.createHospitalData(hospital);
      return hospital;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  ///add a patient to the hospital
  Future addPatient(Hospital hospital, String patientEmail) async {
    //get the user with the email
    Patient patient = await _userServiceProvider.getUser(patientEmail);

    //check if there is any such patient
    if (patient == null) {
      return null;
    }
    //check if user already exists in hospital
    if (hospital.patients.contains(patient.id)) {
      return 'Patient has already been added!';
    }
    //check if user is a patient
    if (patient.type != 'patient') {
      return null;
    }
    return await _userServiceProvider.addUserToHospital(hospital, patient);
  }

  ///add a doctor to the hospital
  Future addDoctor(Doctor doctor, Hospital hospital) async {
    _doctorServiceProvider = new DoctorServiceProvider(hospitalId: hospital.id);
    try {
      //create a new doctor
      await _doctorServiceProvider.createDoctor(doctor);
      //get new doctor with the id;
      doctor = await _doctorServiceProvider.doctor.first;
      await _userServiceProvider.addDoctorToHospital(
          hospital, doctor.documentId);
    } catch (e) {
      throw e.toString();
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
