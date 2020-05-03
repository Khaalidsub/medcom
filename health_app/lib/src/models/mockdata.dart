import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/patient.dart';

final mockData = [
  Patient(
      name: 'abdi',
      id: 'p01',
      age: 18,
      email: 'abdi@gmail.com',
      address: 'taman sri pulai',
      password: '123',
      phoneNumber: '+6011',
      familyNumber: '+6012',
      bloodType: 'A',
      gender: 'M'),
  Hospital(
    name: 'med01',
    id: 'h01',
    email: 'med@gmail.com',
    address: 'taman sri pulai',
    password: '123',
    phoneNumber: '+6011',
  ),
  // Doctor(name: 'sheref', specialization: 'general')
];
