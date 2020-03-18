import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/formCard.dart';

class EnhancedLogin extends StatelessWidget {
  Widget horizentalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: 270,
          height: 2.0,
          color: Colors.black.withOpacity(0.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 5.0, top: 40.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                'images/logor.png',
                                width: 110.0,
                                height: 110.0,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'MEDCOM',
                                style: TextStyle(
                                    fontSize: 46.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    FormCard(),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            //margin: EdgeInsets.only(right: 20),
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.orange[700],
                                Colors.orange[700],
                              ]),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(0.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ],
                            ),
                            child: RaisedButton(
                              color: Color(0xFFd86422),
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  'SIGNIN',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18,
                                      letterSpacing: 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        horizentalLine(),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
                          child: RaisedButton(
                              padding: EdgeInsets.all(7.0),
                              onPressed: () {},
                              color: Colors.grey[200],
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset(
                                    'images/go.png',
                                    width: 40.0,
                                    height: 40.0,
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Text(
                                        "Sign in with Google",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'New User? ',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5d74e3)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
