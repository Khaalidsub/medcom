import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/patient.dart';

import 'Appointement.dart';

//List<Appointment> mockdata = [
//  Appointment(DateTime.now(), "brain cancer", "", "latest"),
//  Appointment(DateTime.now(), "Lung cancer", "", "history"),
//  Appointment(DateTime.now(), "breast cancer", "", "latest"),
//  Appointment(DateTime.now(), "Booty cancer", "", "history"),
//  Appointment(DateTime.now(), "Penis cancer", "", "latest"),
//  Appointment(DateTime.now(), "Nipple cancer", "", "history")
//];

final patientMockData = [
  Patient(
      appointments: [
        Appointment(DateTime.now(), "Sunday",
            "Brain cancer need special treatment", 'p01', "latest"),
        Appointment(DateTime.now(), "Monday",
            "Lucg Cancer require extra glucose", 'p01', "history")
      ],
      name: 'Elon Musk',
      id: 'p01',
      age: 18,
      email: 'abdi@gmail.com',
      address: 'taman sri pulai',
      password: '123',
      phoneNumber: '+6011',
      familyNumber: '+6012',
      bloodType: 'A',
      gender: 'M'),
  Patient(
      appointments: [
        Appointment(DateTime.now(), "Wednesday",
            "eye infection require extra care", 'p02', "latest"),
        Appointment(
            DateTime.now(), "Friday", "Stool comes greyish", 'p02', "history")
      ],
      name: 'Bilgates Jashua',
      id: 'p02',
      age: 18,
      email: 'abdo@gmail.com',
      address: 'taman sri pulai abdo',
      password: 'test2',
      phoneNumber: '+6011',
      familyNumber: '+6012',
      bloodType: 'A',
      gender: 'M')
];

final hospitalMockData = [
  Hospital(
    name: 'med01',
    id: 'h01',
    email: 'med@gmail.com',
    address: 'taman sri pulai',
    password: '123',
    phoneNumber: '+6011',
  ),
];

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
