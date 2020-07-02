import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/medicine.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/DB/doctor_service_provider.dart';
import 'package:health_app/src/services/DB/appointment_service_provider.dart';
import 'package:health_app/src/services/DB/medicine_service_provider.dart';
import 'package:health_app/src/services/DB/user_service_provider.dart';
import 'package:health_app/src/services/auth_service_provider.dart';

class Repository {
  String documentId;
  AuthServiceProvider _authServiceProvider;
  UserServiceProvider _userServiceProvider = new UserServiceProvider();
  DoctorServiceProvider _doctorServiceProvider;
  AppoitmentServiceProvider _appoitmentServiceProvider;
  MedicineServiceProvider _medicineServiceProvider;

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
      _userServiceProvider = new UserServiceProvider(documentId: userAuth.id);
      return _userServiceProvider.userData.first;
    }
    return null;
  }

  //method gets the document based on the id given
  Stream<User> get getUserDocument {
    return _userServiceProvider.getUserWithDocumentId(documentId);
  }

  Stream<List<Appointment>> getPatientAppointmentList(String id) {
    _appoitmentServiceProvider = AppoitmentServiceProvider(patientId: id);
    return _appoitmentServiceProvider.appointmentList;
  }

  //getting the patients List of the hospital
  Stream<List<User>> getPatientList(String hospitalId) {
    return _userServiceProvider.getPatientList(hospitalId);
  }

  ///edit profile of patient
  Future<Patient> editPatient(Patient patient) async {
    try {
      patient = await _userServiceProvider.updatePatientData(patient);

      return patient;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<Hospital> editHospital(Hospital hospital) async {
    try {
      hospital = await _userServiceProvider.updateHospitalData(hospital);

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
    if (patient == null || patient.type != 'patient') {
      return null;
    }
    //check if user already exists in hospital
    if (hospital.patients.contains(patient.id)) {
      return 'Patient has already been added!';
    }

    return await _userServiceProvider.addUserToHospital(hospital, patient);
  }

  ///add a doctor to the hospital
  Future addDoctor(Doctor doctor, Hospital hospital) async {
    _doctorServiceProvider = new DoctorServiceProvider(hospitalId: hospital.id);
    try {
      //create a new doctor
      String docId = await _doctorServiceProvider.createDoctor(doctor);
      //get new doctor with the id;

      await _userServiceProvider.addDoctorToHospital(hospital, docId);
      return hospital;
    } catch (e) {
      return null;
    }
  }

  // add appoitment
  Future addAppoitment(Appointment appointment, String patientEmail) async {
    Patient patient = await _userServiceProvider.getUser(patientEmail);
    try {
      return await _userServiceProvider.addAppointmentToUser(
          appointment, patient);
    } catch (e) {
      return null;
    }
  }
  ///edit profile of patient
  Future<Appointment> editappointement(Appointment appointment) async {
    try {
      appointment = await _userServiceProvider.updateAppointment(appointment);

      return appointment;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  // add medicine to patient
  Future addMedicine(Medicine medicine, Patient patient) async {
    _medicineServiceProvider =
        new MedicineServiceProvider(documentId: documentId);
    try {
      // create new medicine
      String apId = await _medicineServiceProvider.createMedicine(medicine);
      // get new medicine with id
      return apId;
    } catch (e) {
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
      //create a user data for that specific patient and the document is the id from the authentication
      patient = await _userServiceProvider.createPatientData(patient);

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
