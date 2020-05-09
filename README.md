# MEDCOM
##### Team Members : 
- Khaalid Subaan A17CS4037
- Muhammed Adeen Rabbani A17CS4006
- Sherif Abouelmagd  A17CS4009
- Aivaras Misiunas X19EC3012

## Project Description :
In case of accidents, first aid is the most important and crucial. The most important part of first aid is that a patient's history should be known to make sure that correct medical treatment is given. In the majority of the cases, the victim's health is compromised by giving him first aid that conflicts with his health history. This system will help us to make sure that patient health history and crucial health particulars are known before giving him first aid.

## Project Structure
The main part of our Project runs under the lib folder
1.    lib
      - src
        - bloc
        - models
        - resources (backend folder such as firebase services)
        - screens
          - hospitalScreens (all screens meant for the user hospital)
          - patientScreens (all screens meant for the user patient)
          - widgets (all widgets that are being reused will be here)
          - login.dart (common file for all users)
          - welcoming_screen.dart (common file for all users)
        - utils (all files that is not meant to be widget such as routing configs)
        - app.dart
        - hospital_navigation.dart
        - patient_navigation.dart
      - main.dart

This Project we will be using Bloc(business logic component) as our State management/Design Architecture

## Project Deliverable 3
There are two different types of screens : Patient Screens and Hospital Screens

  Patient Screens
  - appointment_list.dart displays all appointments
  - edit_profile.dart : a form page for updating the patients credentials
  - history.dart : display previous appoinments/personal data according to date
  - home.dart : main dashboard of patient
  - patient_registration.dart : Registration page for patient
  - profile.dart displays user credentials
  - scan.dart scanning page whereby patient has their own qr code or can scan other qr code of another patient
  - settings.dart : displays the settings of the patient

  Hospital Screens
  - add_appointment.dart : a form page for adding an apppointment to the patient
  - add_medicine.dart : a form for adding medicine to the updated appointment
  - add_screen.dart : a page for adding patient(manually) to the hospital and adding doctors
  - edit_profile : a form page for updating the hospital credentials
  - history.dart : display previous appoinments/personal data according to date
  - home.dart : main dashboard of hospital
  - hospital_registration.dart : Registration page for hospital
  - hospital_scan.dart : A scanner whereby we add apatient
  - paitent_appointment_list.dart : displays patient details,their previous appointments and new upcoming appointments
  - patinet_info.dart displays patient credentials
  - patient_list.dart displays all registered patients
  - profile.dart displays user credentials
  - update_appointment.dart updates appointment to add diagnosis and medication of the appointment

## Links
- [Prototype video](https://www.youtube.com/watch?v=-KFwS1-F6QY)

- [Prototype Deliverable 2 video](https://youtu.be/Jz8tJc9oQeA)







