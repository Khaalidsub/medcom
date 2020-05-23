import 'package:firebase_auth/firebase_auth.dart';

class User {
  String id;
  String name;
  String password;
  String email;
  String type;
  User({this.id, this.email, this.name, this.type, this.password});
  User.fromFirebase(FirebaseUser user)
      : this(
          id: user.uid,
          email: user.email,
        );
}
