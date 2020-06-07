import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/DB/user_service_provider.dart';
import 'package:health_app/src/services/auth_service_provider.dart';

class Repository {
  String documentId;

  Repository({this.documentId});

  AuthServiceProvider _authServiceProvider;
  UserServiceProvider _userServiceProvider;

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
    _authServiceProvider = new AuthServiceProvider();
    return _authServiceProvider.signIn(email, password);
  }

  //sign up by patient
  Future<Patient> signUpPatient(Patient patient) async {
    _authServiceProvider = new AuthServiceProvider();
    _userServiceProvider = new UserServiceProvider();
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
    _userServiceProvider = new UserServiceProvider();
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
    _userServiceProvider = new UserServiceProvider();
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
