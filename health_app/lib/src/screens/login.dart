import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double height = queryData.size.height;
    double width = queryData.size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/land.jpg"),
            fit: BoxFit.cover,
          )),
          child: Container(
            color: Colors.white.withOpacity(0.8),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 35, left: 10),
                  child: GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.arrow_left),
                        Text('Back'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            // color: Colors.green,

                            height: 200,
                            child: Image.asset(
                              "assets/images/logo-01.png",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            focusColor: Colors.white,
                            suffixIcon: Icon(Icons.mail),
                            hintText: 'Enter Email'),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: Icon(Icons.edit),
                            focusColor: Colors.blue,
                            hintText: 'Enter Password'),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            splashColor: Colors.blueAccent,
                            elevation: 10,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            color: Colors.blue,
                            child: Text(
                              'Sign In',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Forgot Password? ',
                            style:
                                TextStyle(fontSize: 18, color: Colors.blueGrey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
