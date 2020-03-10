import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, left: 20),
      width: double.infinity,
      height: 270,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 15.0),
              blurRadius: 15.0,
            ),
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, -10.0),
              blurRadius: 10.0,
            )
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Email',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'medcom@gmail.com',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Password',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'medcom2020',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Forget Password?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
