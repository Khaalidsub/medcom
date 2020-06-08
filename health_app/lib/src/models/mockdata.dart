import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/medicine.dart';
import 'package:health_app/src/models/patient.dart';

import 'Appointement.dart';

Medicine med1 = Medicine(
    daily: '2',
    dateEnd: DateTime.now(),
    dateStart: DateTime.now(),
    name: 'panadol');
Appointment ap1 = Appointment(
    date: DateTime.now(),
    day: "Sunday",
    description: "General check up",
    ownerId: 'p01',
    status: "latest");
Appointment ap2 = Appointment(
    date: DateTime.now(),
    day: "Sunday",
    description: "General checkup",
    ownerId: 'p01',
    diagnosis: 'Slight Migraine',
    status: "history",
    doctorName: 'adeen',
    medicines: [med1]);

Patient p1 = Patient(
    name: 'abdi',
    id: 'p01',
    age: 18,
    email: 'abdi@gmail.com',
    address: 'taman sri pulai',
    password: '123',
    phoneNumber: '+6011',
    familyNumber: '+6012',
    bloodType: 'A',
    gender: 'M',
    appointments: [ap1, ap2]);

Doctor d1 = Doctor(name: 'sheref', specialization: 'general specialization');
Hospital h1 = Hospital(
  name: 'med01',
  id: 'h01',
  email: 'med@gmail.com',
  address: 'taman sri pulai',
  password: '123',
  phoneNumber: '+6011',
  doctors: [d1],
);

final mockData = [p1, h1];
