import 'package:flutter/material.dart';

import '../../patient_navigation.dart';
import 'settings.dart';

class PatientProfile extends StatelessWidget {
  // Function changeIndex;
  // int index;
  // PatientProfile({this.changeIndex, this.index});
  @override
  Widget build(BuildContext context) {
    // MediaQueryData queryData = MediaQuery.of(context);
    // double width = queryData.size.width;
    return SingleChildScrollView(
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
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientSettings())),
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
                            'Blood Type',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            'Lorem Ipsum',
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
                            'Blood Type',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            'Lorem Ipsum',
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
                            'Alergese',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            'Lorem Ipsum',
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
                            'Family Member',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            'Lorem Ipsum',
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
                            'Lorem Ipsum',
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
                            'Location',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            'Lorem Ipsum',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      child: Text('Update'),
                      textColor: Colors.white,
                      onPressed: () {},
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
    );
  }
}
