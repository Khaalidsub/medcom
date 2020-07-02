import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/medicine.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';

class Appointment extends User {
  String date;
  String day;
  String description;
  dynamic ownerId; //storing the owner of this appointment.
  String status; // latest or history
  String diagnosis;
  String doctorName;
  List<Medicine> medicines = new List();
  Appointment(
      {this.date,
      this.day,
      this.description,
      this.ownerId,
      this.status,
      this.medicines,
      this.diagnosis,
      this.doctorName,
      doctorID,
      ownerID,
      String documentId});

//copy constructor
  Appointment.copy(Appointment from)
      : this(
            date: from.date,
            day: from.day,
            description: from.description,
            ownerId: from.ownerId,
            status: from.status,
            medicines: from.medicines);
  Appointment.fromFireStore(DocumentSnapshot snap)
      : this(
          date: snap.data['date'],
          day: snap.data['day'],
          description: snap.data['description'],
          diagnosis: snap.data['diagnosis'],
          doctorID: snap.data['doctorID'],
          ownerID: snap.data['ownerID'],
          status: snap.data['status'],
          documentId: snap.documentID,
        );
  toFireStore({doctorId = null}) {
    return {
      'date': this.date,
      'day': this.day,
      'description': this.description,
      'diagnosis': this.diagnosis,
      'doctorID': doctorId,
      'ownerID ': this.ownerId,
      'status': this.status
    };
  }

  void addMedicine(Medicine med) {
    if (medicines == null) {
      medicines = new List();
    }

    medicines.add(med);
  }

// //usual
//   get date => this.date;
//   get description => this.description;
//   get id => this.ownerId;
}
