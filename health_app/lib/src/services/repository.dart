import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/DB/user_service_provider.dart';
import 'package:health_app/src/services/auth_service_provider.dart';

class Repository {
  AuthServiceProvider _authServiceProvider;
  UserServiceProvider _userServiceProvider;
  //sign in
  Future<User> signIn(String email, String password) {
    _authServiceProvider = new AuthServiceProvider();
    return _authServiceProvider.signIn(email, password);
  }

  //sign up
  Future<User> signUpPatient(Patient patient) {
    _authServiceProvider = new AuthServiceProvider();
    _userServiceProvider = new UserServiceProvider();
    //go to authentication provider and return user for the id
    _authServiceProvider.signUp(patient.email, patient.password).then((user) {
      patient.id = user.id;
      //create a user data for that specific patient and the document is the id from the authentication
      _userServiceProvider.createPatientData(patient).then((value) => user);
    }).catchError((error) {
      print(error.toString());
    });
  }
  //logout
}
