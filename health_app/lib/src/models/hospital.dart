import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/models/user.dart';

class Hospital extends User {
  String phoneNumber;
  String address;
  List<Doctor> doctors;

  Hospital({
    String id,
    String email,
    String name,
    String password,
    this.phoneNumber,
    this.address,
  }) : super(id, email, name, 'hospital', password);

  void addDoctor(Doctor doc) {
    doctors.add(doc);
  }

  void deleteDoctor(Doctor doc) {
    doctors.remove(doc);
  }
}