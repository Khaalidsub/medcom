import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_app/src/models/user.dart';

class AuthServiceProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String uid;
  //check if there is any user session
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  //sign in
  Future<User> signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  User _userFromFirebase(FirebaseUser user) {
    if (user != null) {
      uid = user.uid;
      return User.fromFirebase(user);
    }
    return null;
  }

  //sign up
  Future<User> signUp(String email, String password) async {
    try {
      // _auth.
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //logout user
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
