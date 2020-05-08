import 'package:health_app/src/models/Appointement.dart';
import 'package:health_app/src/models/user.dart';

class Patient extends User {
  String bloodType;
  String familyNumber;
  String phoneNumber;
  String address;
  String gender;
  String alergese;
  int age;
  //apointment List
  List<Appointment> appointments;


  String listAllData() {
    return "Name: ${this.name}\n" +
        "Age: ${this.age}\n" +
        "${this.appointments}\n" +
        "Blooad Type: ${this.bloodType}\n" +
        "Email: ${this.email}\n" +
        "Family: ${this.familyNumber}\n" +
        "Gender: ${this.gender}\n" +
        "Id: ${this.id}\n" +
        "Phone: ${this.phoneNumber}\n" +
        "Adress: ${this.address}\n";
  }

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
      this.alergese,
      this.bloodType,
      this.familyNumber,
      this.phoneNumber,
      this.address,
      this.gender,
      this.age,
      this.appointments})
      : super(id, email, name, 'patient', password);
}
