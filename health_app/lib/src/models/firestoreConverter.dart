import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FireStoreConverter<T> {
  toFireStore();
  T fromFireStore(DocumentSnapshot snapshot);
  // FireStoreConverter.fromFirebase(DocumentSnapshot snapshot);
}
