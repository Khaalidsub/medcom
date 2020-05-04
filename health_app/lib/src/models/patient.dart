import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/patient_navigation.dart';

class Patient extends User {
  String bloodType;
  String familyNumber;
  String phoneNumber;
  String address;
  String gender;
  int age;
  //apointment List
  List<Appointment> appointments;
  
  
  
  //copy constructor
  Patient.copy(Patient from)
      : this(
            id: from.id,
            email: from.email,
            name: from.name,
            password: from.password,
            bloodType: from.bloodType,
            familyNumber: from.familyNumber,
            phoneNumber: from.phoneNumber,
            address: from.address,
            gender: from.gender,
            age: from.age,
            appointments: from.appointments);

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