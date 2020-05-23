import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/blocs/login_bloc.dart';
import 'package:health_app/src/screens/welcoming_screen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final LoginBloc _loginBloc = BlocProvider.getBloc<LoginBloc>();

  String error = '';

  @override
  void dispose() {
    super.dispose();
    _loginBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double height = queryData.size.height;
    double width = queryData.size.width;

    return Scaffold(
      body: Builder(builder: (context) {
        return SingleChildScrollView(
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
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomingScreen())),
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
                        Container(
                          height: 200,
                          child: Hero(
                            tag: 'logo',
                            child: Image.asset(
                              "assets/images/logo-01.png",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        buildEmailField(),
                        SizedBox(
                          height: 30,
                        ),
                        buildPasswordField(),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            buildSubmitButton(),
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
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
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
        );
      }),
    );
  }

  Widget buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email',
          focusColor: Colors.white,
          suffixIcon: Icon(Icons.mail),
          hintText: 'Enter Email'),
      onChanged: (val) {},
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: Icon(Icons.edit),
          focusColor: Colors.blue,
          hintText: 'Enter Password'),
      onChanged: (val) {},
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      splashColor: Colors.blueAccent,
      elevation: 10,
      padding: EdgeInsets.symmetric(vertical: 15),
      color: Colors.blue,
      child: Text(
        'Sign In',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  void showErrorMessage(BuildContext context) {
    final snackbar = SnackBar(
      backgroundColor: Colors.pinkAccent,
      content: Text(
        error,
        style: TextStyle(color: Colors.white),
      ),
      duration: new Duration(seconds: 3),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
