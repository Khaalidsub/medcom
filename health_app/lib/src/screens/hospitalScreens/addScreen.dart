import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
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
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FloatingActionButton(
            child: Text(
              'Add Patient',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {},
            isExtended: true,
            heroTag: 'add patient',
          ),
        ],
      ),
    );
  }

  Widget buildPatient() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 200,
            child: CircleAvatar(
              backgroundColor: Colors.grey[50],
              child: Container(
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.black,
                ),
              ),
              maxRadius: 80,
              minRadius: 30,
            ),
          ),
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
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Number of Patients',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      '50',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Number of Appointments',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      '60',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Number of Appointments',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      '60',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {},
              isExtended: false,
              heroTag: 'add patient',
            ),
          ),
        ],
      ),
    );
  }
}
