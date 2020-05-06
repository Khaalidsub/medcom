import 'package:health_app/src/models/medicine.dart';

class Appointment {
  DateTime date;
  String day;
  String description;
  String ownerId; //storing the owner of this appointment.
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
      this.doctorName});

//copy constructor
  Appointment.copy(Appointment from)
      : this(
            date: from.date,
            day: from.day,
            description: from.description,
            ownerId: from.ownerId,
            status: from.status,
            medicines: from.medicines);
  void addMedicines(List<Medicine> meds) {
    medicines.addAll(meds);
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
