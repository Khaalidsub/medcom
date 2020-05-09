import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';

class HospitalProfile extends StatefulWidget {
  Hospital user;
  HospitalProfile(this.user);

  final TextEditingController numOfBeds = new TextEditingController();

  final TextEditingController phoneNumber = new TextEditingController();

  @override
  _HospitalProfileState createState() => _HospitalProfileState();
}

class _HospitalProfileState extends State<HospitalProfile> {
  void _navigate() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Container(
            padding:
                EdgeInsets.only(top: 100, bottom: 100, left: 20, right: 20),
            child: Material(
              child: SingleChildScrollView(
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
                            controller: widget.numOfBeds,
                            label: "${widget.user.numOfBeds}",
                            color: Colors.white,
                            icon: Icon(FontAwesomeIcons.bed),
                            type: 'name',
                            hint: 'e.g 1000',
                          ),
                          Reusablefield(
                            controller: widget.phoneNumber,
                            label: "${widget.user.phoneNumber ?? '+601103024'}",
                            color: Colors.white,
                            icon: Icon(Icons.phone),
                            type: 'phone',
                            hint: 'e.g +6011616178',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 0),
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        onPressed: () {
                          this.widget.user.numOfBeds =
                              int.parse(widget.numOfBeds.text);
                          this.widget.user.phoneNumber =
                              widget.phoneNumber.text;

                          showDialog(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Success'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(
                                          "Details Have been adden successfully!"),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Alright'),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); //pop the dialog box
                                      Navigator.pop(
                                          context,
                                          this
                                              .widget
                                              .user); //sending back the updated data...
                                      setState(() {});
                                    },
                                  ),
                                ],
                              );
                            },
                          );
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
              ),
            ),
          );
        });
    // final temp = await Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) =>
    //             PatientUpdate(Patient.copy(this.widget.user))));
    // if (temp != null) {
    //   setState(() {
    //     this.widget.user = temp;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Profile',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 50, right: 50, top: 6),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/settings'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                maxRadius: 50,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage('assets/images/buildingIcon.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.user.name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Text(
                  'ID: ${widget.user.id}',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 12,
                  child: VerticalDivider(
                    width: 2,
                    color: Colors.black,
                  ),
                  //  onPressed: () => Navigator.pushNamed(context, '/settings'),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Number Of Patients: ${widget.user.patients.length}',
                  style: TextStyle(fontSize: 15),
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'ID: 58496',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 12,
                    child: VerticalDivider(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Member: Lorem Ipsum',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Address',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                widget.user.address,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Bed Count',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              '${widget.user.numOfBeds}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Doctors Count',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              '${widget.user.doctors.length}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              widget.user.phoneNumber,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        color: Colors.blueAccent,
                        child: Text(
                          'Update',
                          style: TextStyle(fontSize: 20),
                        ),
                        textColor: Colors.white,
                        onPressed: () => _navigate(),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Reusablefield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Color color;
  final bool isPass;
  final Icon icon;
  final String type;
  final String hint;
  Reusablefield(
      {@required this.controller,
      @required this.label,
      @required this.color,
      @required this.icon,
      @required this.hint,
      this.isPass,
      this.type});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: type == 'phone' ? TextInputType.phone : null,
        inputFormatters: type == 'phone'
            ? [
                WhitelistingTextInputFormatter(RegExp("[+0-9]")),
                LengthLimitingTextInputFormatter(13),
              ]
            : type == 'allegese'
                ? [
                    WhitelistingTextInputFormatter(RegExp("[a-z A-Z]")),
                    LengthLimitingTextInputFormatter(50)
                  ]
                : null,
        obscureText: isPass == null ? false : isPass,
        controller: this.controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          suffixIcon: icon,
          fillColor: color,
          filled: true,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 0, style: BorderStyle.none)),
        ));
  }
}
