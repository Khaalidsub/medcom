import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/blocs/hospital_blocs/hospital_edit_bloc.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/progress_bar.dart';
import 'package:health_app/src/screens/widgets/stream_input_field.dart';

class HospitalEditProfile extends StatefulWidget {
//instantiating bloc

  final Hospital hospital;
  HospitalEditProfile(this.hospital);
  final TextEditingController phoneNumber = new TextEditingController();
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<HospitalEditProfile> {
  final hospitalEditBloc = HospitalEditBloc();
  Hospital hospital;
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
              hospital = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(30),
                      height: 200,
                      child: Hero(
                        tag: 'logo',
                        child: Image.asset(
                          "assets/images/buildingIcon.png",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 5, 25, 25),
                      child: Wrap(
                        runSpacing: 20,
                        children: <Widget>[
                          Reusablefield(
                            stream: hospitalEditBloc.name,
                            onChangeFunction: hospitalEditBloc.changeName,
                            label: "${widget.hospital.name}",
                            color: Colors.white,
                            icon: Icon(Icons.person),
                            type: TextInputType.text,
                            hint: 'e.g James Smith',
                          ),
                          Reusablefield(
                            stream: hospitalEditBloc.phoneNumber,
                            onChangeFunction:
                                hospitalEditBloc.changePhoneNumber,
                            label: "${widget.hospital.phoneNumber}",
                            color: Colors.white,
                            icon: Icon(Icons.phone),
                            type: TextInputType.number,
                            hint: 'e.g +6011616178',
                          ),
                          Reusablefield(
                            stream: hospitalEditBloc.email,
                            onChangeFunction: hospitalEditBloc.changeEmail,
                            //controller: widget.phoneNumber,
                            label: "${widget.hospital.email}",
                            color: Colors.white,
                            icon: Icon(Icons.mail),
                            type: TextInputType.emailAddress,
                            hint: 'e.g user@gmail.com',
                          ),
                          Reusablefield(
                            stream: hospitalEditBloc.numOfBeds,
                            onChangeFunction: hospitalEditBloc.changeEmail,
                            //controller: widget.phoneNumber,
                            label: "${widget.hospital.numOfBeds}",
                            color: Colors.white,
                            icon: Icon(FontAwesomeIcons.bed),
                            type: TextInputType.number,
                            hint: 'e.g 30',
                          ),
                          Reusablefield(
                            //wcontroller: widget.phoneNumber,
                            stream: hospitalEditBloc.address,
                            onChangeFunction: hospitalEditBloc.changeAddress,
                            label: "${widget.hospital.address}",
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
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        onPressed: () async {
                          //so when user updates, I want to trigger backend operation.
                          //update the UI
                          if (widget.phoneNumber.text.isEmpty)
                            widget.phoneNumber.text =
                                widget.hospital.phoneNumber;
                          widget.hospital.phoneNumber = widget.phoneNumber.text;

                          await buildShowDialog(context);
                          Navigator.pop(
                              context,
                              widget
                                  .hospital); //sending back the updated data...
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                        disabledColor: Colors.blueAccent,
                        child: Text(
                          "Update",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
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

  Future buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Details Have been adden successfully!"),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Alright'),
              onPressed: () {
                Navigator.of(context).pop(); //pop the dialog box
              },
            ),
          ],
        );
      },
    );
  }
}
