import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/models/medicine.dart';
import 'package:health_app/src/models/user.dart';

class Appointment extends User {
  String date;
  String day;
  String description;
  String ownerID; //storing the owner of this appointment.
  String status; // latest or history
  String diagnosis;
  Doctor doctor;
  String id;
  String hospitalId;
  List<Medicine> medicines = new List();
  Appointment(
      {this.date,
      this.day,
      this.description,
      this.ownerID,
      this.status,
      this.medicines,
      this.diagnosis,
      this.doctor,
      this.id,
      String documentId,
      this.hospitalId});

//copy constructor
  Appointment.copy(Appointment from)
      : this(
            date: from.date,
            day: from.day,
            description: from.description,
            ownerID: from.ownerID,
            status: from.status,
            medicines: from.medicines);
  Appointment.fromFireStore(DocumentSnapshot snap)
      : this(
          doctor: Doctor.fromAppointment(snap),
          medicines: Medicine().fromFirestore(snap),
          id: snap.documentID,
          hospitalId: snap.data['hospital'],
          date: snap.data['date'],
          day: snap.data['day'],
          description: snap.data['description'],
          diagnosis: snap.data['diagnosis'] ?? '',
          ownerID: snap.data['ownerID'],
          status: snap.data['status'],
        );
  toFireStore() {
    return {
      'id': this.id,
      'date': this.date,
      'day': this.day,
      'description': this.description,
      'diagnosis': null,
      'doctor': null,
      'hospital': this.hospitalId,
      'ownerID': this.ownerID,
      'status': this.status,
      'medicines': []
    };
  }

  toUpdateFirestore() {
    return {
      'id': this.id,
      'date': this.date,
      'day': this.day,
      'description': this.description,
      'diagnosis': this.diagnosis,
      'doctor': this.doctor?.toFirestore() ?? null,
      'ownerID': this.ownerID,
      'status': this.status,
      'medicines': [
            // ignore: sdk_version_ui_as_code
            ...this.medicines?.map(((medicines) => medicines.toFirestore()))
          ] ??
          []
    };
  }

// //usual
//   get date => this.date;
//   get description => this.description;
//   get id => this.ownerId;
}
