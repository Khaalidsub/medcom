import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/models/user.dart';

class Patient extends User {
  String bloodType;
  String familyNumber;
  String phoneNumber;
  String address;
  String gender;
  int age;
  //apointment List
  List<Appointment> appointments;

  Patient(
      {String id,
      String email,
      String name,
      String password,
      this.bloodType,
      this.familyNumber,
      this.phoneNumber,
      this.address,
      this.gender,
      this.age,
      this.appointments})
      : super(id, email, name, 'patient', password);
}
