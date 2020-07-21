import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_app/src/models/firestoreConverter.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/patient.dart';

class User implements FireStoreConverter {
  String id;
  String name;
  String password;
  String email;
  String type;
  String imageUrl;
  User(
      {this.id,
      this.email,
      this.name,
      this.type,
      this.password,
      this.imageUrl});
  User.fromFirebase(FirebaseUser user)
      : this(
          id: user.uid,
          email: user.email,
        );

  @override
  fromFireStore(DocumentSnapshot snapshot) {
    if (snapshot.data['type'] == 'patient') {
      return Patient.fromFirestore(snapshot);
    } else if (snapshot.data['type'] == 'hospital')
      return Hospital.fromFirestore(snapshot);
  }

  @override
  toFireStore() {}
}
