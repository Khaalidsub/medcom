import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/services/DB/provider.dart';

class DoctorServiceProvider extends Provider<Doctor> {
  final CollectionReference doctorCollection =
      Firestore.instance.collection('doctor_list');
  String documentId;
  String hospitalId;
  DoctorServiceProvider(
      {Doctor doctor, String whereId, this.documentId, this.hospitalId})
      : super(doctor, Firestore.instance.collection('doctor_list'),
            id: documentId, whereId: whereId);
}
