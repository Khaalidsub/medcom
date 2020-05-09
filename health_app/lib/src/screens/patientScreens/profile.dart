import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import '../../models/patient.dart';

class PatientProfile extends StatefulWidget {
  Patient user;
  final TextEditingController bloodtype = new TextEditingController();

  final TextEditingController familyNumber = new TextEditingController();

  final TextEditingController allergese = new TextEditingController();

  final TextEditingController phone = new TextEditingController();

  final TextEditingController password = new TextEditingController();

  final TextEditingController confirmPassword = new TextEditingController();
  PatientProfile(this.user);

  @override
  _PatientProfileState createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  void _navigate() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Container(
          padding: EdgeInsets.only(top: 100, bottom: 100, left: 20, right: 20),
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
                        "assets/images/ill.png",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 5, 25, 25),
                    child: Wrap(
                      runSpacing: 20,
                      children: <Widget>[
                        Reusablefield(
                          controller: widget.bloodtype,
                          label: "${widget.user.bloodType}",
                          color: Colors.white,
                          icon: Icon(Icons.local_hospital),
                          type: 'name',
                          hint: 'e.g A+',
                        ),
                        Reusablefield(
                          controller: widget.familyNumber,
                          label: "${widget.user.familyNumber ?? '+601103024'}",
                          color: Colors.white,
                          icon: Icon(Icons.phone),
                          type: 'phone',
                          hint: 'e.g +6011616178',
                        ),
                        Reusablefield(
                          controller: widget.allergese,
                          label: "${widget.user.alergese}",
                          color: Colors.white,
                          icon: Icon(FontAwesomeIcons.bookMedical),
                          type: 'allergese',
                          hint: 'e.g Value, value, value',
                        ),
                        Reusablefield(
                          controller: widget.phone,
                          label: "${widget.user.phoneNumber}",
                          color: Colors.white,
                          icon: Icon(Icons.phone),
                          type: 'phone',
                          hint: 'e.g +6011838393',
                        ),
                        Reusablefield(
                          controller: widget.password,
                          label: "${widget.user.password}",
                          color: Colors.white,
                          icon: Icon(Icons.vpn_key),
                          isPass: true,
                          hint: 'e.g your password',
                        ),
                        Reusablefield(
                          controller: widget.confirmPassword,
                          label: "${widget.user.password}",
                          color: Colors.white,
                          icon: Icon(Icons.vpn_key),
                          isPass: true,
                          hint: 'Rewrite Password Again',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        if (widget.password.text ==
                            widget.confirmPassword.text) {
                          //do something here.

                          this.widget.user.bloodType = widget.bloodtype.text;
                          this.widget.user.familyNumber =
                              widget.familyNumber.text;
                          this.widget.user.alergese = widget.allergese.text;
                          this.widget.user.password = widget.password.text;
                          this.widget.user.phoneNumber = widget.phone.text;

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
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Password Donot Match..'),
                              backgroundColor: Colors.red));
                        }
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
      },
    );
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
                  onPressed: () => Navigator.pushNamed(context, '/settings'),
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/ill.png'),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: Colors.blueAccent.withOpacity(.2), width: 1)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Name: ${widget.user?.name}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'ID: ${widget.user?.id}',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'ID: 58496',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Gender: ${widget.user?.gender}',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 12,
                    child: VerticalDivider(
                      width: 5,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Age: ${widget.user?.age}',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Wrap(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  runSpacing: 30,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Blood Type',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          widget.user?.bloodType ?? "null",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Alergese',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          widget.user.alergese ?? "Null",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Emergancy Member',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          widget.user?.familyNumber,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
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
                          widget.user?.phoneNumber,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
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
                          widget.user?.address,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        child: Text('Update'),
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

class DisplayUserField extends StatelessWidget {
  final String label;
  final String info;
  DisplayUserField({this.info, this.label});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        Text(
          info,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
