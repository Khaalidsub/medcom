import 'package:health_app/src/models/medicine.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';


class Appointment extends User {
  DateTime date;
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
      this.doctorName, doctorID, ownerID, String documentId});

//copy constructor
  Appointment.copy(Appointment from)
      : this(
            date: from.date,
            day: from.day,
            description: from.description,
            ownerId: from.ownerId,
            status: from.status,
            medicines: from.medicines);

  get patient => null;
  void addMedicines(List<Medicine> meds) {
    medicines.addAll(meds);
  }

  void addMedicine(Medicine med) {
    if (medicines == null) {
      medicines = new List();
    }

    medicines.add(med);
  }
  
  void addPatient(String patientId) {
    ownerId.add(patientId);
  }

// //usual
//   get date => this.date;
//   get description => this.description;
//   get id => this.ownerId;
}
