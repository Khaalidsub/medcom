import 'package:firebase_auth/firebase_auth.dart';

class User {
  String id;
  String name;
  String password;
  String email;
  String type;
  String imageUrl;
  User({this.id, this.email, this.name, this.type, this.password,this.imageUrl});
  User.fromFirebase(FirebaseUser user)
      : this(
          id: user.uid,
          email: user.email,
        );
}
