import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/blocs/hospital_blocs/hospital_edit_bloc.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/dialogues.dart';
import 'package:health_app/src/screens/widgets/error_message.dart';
import 'package:health_app/src/screens/widgets/progress_bar.dart';
import 'package:health_app/src/screens/widgets/stream_input_field.dart';
import 'package:image_picker/image_picker.dart';

class HospitalEditProfile extends StatefulWidget {
//instantiating bloc

  final TextEditingController phoneNumber = new TextEditingController();
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<HospitalEditProfile> {
  final hospitalEditBloc = HospitalEditBloc();
  Hospital hospital;
  File imageFile;
  

   Future getImage(BuildContext context, ImageSource source) async{
     ImagePicker picker = ImagePicker();
    final pickedFile =await picker.getImage(source: source);
    await hospitalEditBloc.changeImage(File(pickedFile.path));
  
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Edit Profile',
      ),
      body: StreamBuilder<Object>(
          stream: hospitalEditBloc.streamUserData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              this.hospital = snapshot.data;
           
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: ()=>openImagePicker(context,getImage),
                                          child: Container(
                        padding: EdgeInsets.all(30),
                        height: 200,
                        width: 200,
                        child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: StreamBuilder<Object>(
                                          stream: hospitalEditBloc.imageFile,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                               return Image.file(
                                              snapshot.data,
                                              fit: BoxFit.cover,
                                            );
                                            }
                                            return Image.network(
                                              hospital.imageUrl,
                                              fit: BoxFit.cover,
                                            );
                                          }
                                        ),
                                      ),
                                    ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 5, 25, 25),
                      child: Wrap(
                        runSpacing: 20,
                        children: <Widget>[
                          Reusablefield(
                            label: "Name",
                            initialValue: hospital.name,
                            stream: hospitalEditBloc.name,
                            onChangeFunction: hospitalEditBloc.changeName,
                            color: Colors.white,
                            icon: Icon(Icons.person),
                            type: TextInputType.text,
                            hint: 'e.g James Smith',
                          ),
                          Reusablefield(
                            label: "Phone Number",
                            initialValue: hospital.phoneNumber,
                            stream: hospitalEditBloc.phoneNumber,
                            onChangeFunction:
                                hospitalEditBloc.changePhoneNumber,
                            color: Colors.white,
                            icon: Icon(Icons.phone),
                            type: TextInputType.number,
                            hint: 'e.g +6011616178',
                          ),
                          Reusablefield(
                            label: "Email",
                            initialValue: hospital.email,
                            stream: hospitalEditBloc.email,
                            onChangeFunction: hospitalEditBloc.changeEmail,
                            color: Colors.white,
                            icon: Icon(Icons.mail),
                            type: TextInputType.emailAddress,
                            hint: 'e.g user@gmail.com',
                          ),
                          Reusablefield(
                            label: "Bed Count",
                            initialValue: hospital.numOfBeds.toString(),
                            stream: hospitalEditBloc.numOfBeds,
                            onChangeFunction: hospitalEditBloc.changeEmail,
                            color: Colors.white,
                            icon: Icon(FontAwesomeIcons.bed),
                            type: TextInputType.number,
                            hint: 'e.g 30',
                          ),
                          Reusablefield(
                            label: "Address",
                            initialValue: hospital.address,
                            stream: hospitalEditBloc.address,
                            onChangeFunction: hospitalEditBloc.changeAddress,
                            color: Colors.white,
                            icon: Icon(FontAwesomeIcons.addressBook),
                            type: TextInputType.text,
                            hint: 'e.g George town London',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 0),
                      child: StreamBuilder<Object>(
                          stream: hospitalEditBloc.submitStatus,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data) {
                                return ProgressBar();
                              }
                            }
                            return RaisedButton(
                              color: Colors.blueAccent,
                              onPressed: () async {
                                //so when user updates, I want to trigger backend operation.
                                //update the UI
                                hospitalEditBloc.showProgressBar(true);
                                updateHospitalProfile(context, hospital);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 15),
                              disabledColor: Colors.blueAccent,
                              child: Text(
                                "Update",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              );
            }
            return ProgressBar(
              color: Colors.blueAccent,
            );
          }),
    );
  }

  void updateHospitalProfile(BuildContext context, Hospital hospital) async {
    dynamic result = await hospitalEditBloc.editHospital(hospital);

    hospitalEditBloc.showProgressBar(false);
    if (result == null) {
      ErrorMessage(context: context, input: 'Something went wrong!')
          .showErrorMessage();
      hospitalEditBloc.showProgressBar(false);
    }
    ErrorMessage(context: context, input: 'Profile has been updated!')
        .showSuccessMessage();
    Navigator.popUntil(context, ModalRoute.withName('/hospital'));
  }

  //Future buildShowDialog(BuildContext context) {
  //  return showDialog(
  //    context: context,
  //    barrierDismissible: false, // user must tap button!
  //    builder: (BuildContext context) {
  //      return AlertDialog(
  //        title: Text('Success'),
  //        content: SingleChildScrollView(
  //          child: ListBody(
  //            children: <Widget>[
  //              Text("Details Have been adden successfully!"),
  //            ],
  //          ),
  //        ),
  //        actions: <Widget>[
  //          FlatButton(
  //            child: Text('Alright'),
  //            onPressed: () {
  //              Navigator.of(context).pop(); //pop the dialog box
  //            },
  //          ),
  //        ],
  //      );
  //    },
  //  );
  //}
}
