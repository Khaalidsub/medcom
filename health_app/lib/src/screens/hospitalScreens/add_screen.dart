import 'package:flutter/material.dart';
import 'package:health_app/src/models/doctor.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/input_field.dart';

class AddScreen extends StatelessWidget {
  var _controller = TextEditingController();
  String name, specialization;

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        buildPatient(),
        buildDoctor(),
      ],
    );
  }

  Widget buildDoctor() {
    return Scaffold(
        appBar: AppNav(
          appBar: AppBar(),
          name: 'Doctor',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    "assets/images/logo-01.png",
                  ),
                ),
              ),
              Container(
                height: 200,
                padding: EdgeInsets.all(20),
                child: Wrap(runSpacing: 20, children: <Widget>[
                  Reusablefield(
                      label: "Name",
                      color: Colors.white,
                      icon: Icon(Icons.nature_people),
                      callback: (val) {
                        setState(() {
                          name = val;
                        });
                      }),
                  Reusablefield(
                      label: "Specialization",
                      color: Colors.white,
                      icon: Icon(Icons.tune),
                      callback: (val) {
                        setState(() {
                          specialization = val;
                        });
                      }),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: RaisedButton(
                  onPressed: () {
                    Doctor newdoc = new Doctor(); //this->names, this->spec);
                    //widget.data.doctor.add(newdoc);
                    Navigator.pop(null, newdoc);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  color: Colors.blueAccent,
                  //disabledColor: Colors.blueAccent,
                  child: Text(
                    "Add",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildPatient() {
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
        name: 'Add',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 120,
              child: Container(
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
                height: 80,
                margin: const EdgeInsets.only(right: 20, left: 20),
                child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16.0),
                        prefixIcon: Icon(
                          Icons.account_box,
                          size: 28.0,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () => _controller.clear(),
                          icon: Icon(Icons.add),
                        ),
                        hintText: "Write ID",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )))),
            Divider(),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Patients',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 15, right: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Number of Patients',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '50',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Number of Appointments',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '60',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Number of Completed Appointments',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '60',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Want to add a doctor?',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 1),
              child: Text(
                'Swipe left',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
