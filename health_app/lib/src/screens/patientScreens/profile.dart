import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/bottom_navigation.dart';
import 'package:health_app/src/screens/widgets/chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PatientProfile extends StatelessWidget {
  Function changeIndex;
  int index;
  PatientProfile({this.changeIndex, this.index});
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    return Scaffold(
      appBar: AppNav(
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 50, right: 20, top: 6),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 260),
                child: IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                  onPressed: () {},
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
                'Mike Edward',
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
                    'Gender: Male',
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
                    'Age: 18',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(left: 20, right: 20, top: 8),
                width: 320,
                height: 330,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Blood Type',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Allergese',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Family member',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Location',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Phone',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                  width: 100,
                                  height: 35,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              const Radius.circular(30.0))),
                                      labelText: '',
                                      hintText: 'f',
                                    ),
                                    autofocus: false,
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  width: 100,
                                  height: 35,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              const Radius.circular(30.0))),
                                      labelText: '',
                                      hintText: '',
                                    ),
                                    autofocus: false,
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                  width: 100,
                                  height: 35,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              const Radius.circular(30.0))),
                                      labelText: '',
                                      hintText: '',
                                    ),
                                    autofocus: false,
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  width: 100,
                                  height: 35,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              const Radius.circular(30.0))),
                                      labelText: '',
                                      hintText: '',
                                    ),
                                    autofocus: false,
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  width: 100,
                                  height: 35,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              const Radius.circular(30.0))),
                                      labelText: '',
                                      hintText: '',
                                    ),
                                    autofocus: false,
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                            ]),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                      color: Colors.blueAccent,
                      child: Text('Update'),
                      textColor: Colors.white,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        changeIndex: changeIndex,
        index: index,
      ),
    );
  }

  padding({int left, int top}) {}
}
