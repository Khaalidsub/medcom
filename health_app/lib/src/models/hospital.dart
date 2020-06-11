import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/models/user.dart';

class Hospital extends User {
  String phoneNumber;
  String address;
  String dirName;
  int numOfBeds;
  List<dynamic> doctors;
  List<dynamic> patients;
  Hospital(
      {String id,
      String email,
      String name,
      String password,
      this.dirName,
      this.numOfBeds,
      this.phoneNumber,
      this.address,
      this.doctors,
      this.patients})
      : super(
            id: id,
            email: email,
            name: name,
            type: 'hospital',
            password: password);

  void addDoctor(String doc) {
    doctors.add(doc);
  }

  void deleteDoctor(Doctor doc) {
    doctors.remove(doc);
  }

  void addPatient(String patientId) {
    patients.add(patientId);
  }
}
