import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/auth_service_provider.dart';

class Repository {
  AuthServiceProvider _authServiceProvider;
  //sign in
  Future<User> signIn(String email, String password) {
    _authServiceProvider = new AuthServiceProvider();
    return _authServiceProvider.signIn(email, password);
  }
  //sign up
  //logout
}
