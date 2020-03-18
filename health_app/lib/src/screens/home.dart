import 'package:flutter/material.dart';
import 'package:health_app/src/screens/widgets/app_nav.dart';
import 'package:health_app/src/screens/widgets/bottom_navigation.dart';
import 'package:health_app/src/screens/widgets/chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  final Widget child;

  Home({Key key, this.child}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

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
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Notification',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 120,
                    width: width * 0.29,
                    child: Card(
                      color: Color(0xffFFC4C4),
                      child: Icon(
                        FontAwesomeIcons.algolia,
                        size: 50,
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: width * 0.29,
                    child: Card(
                      color: Color(0xffF5DD9C),
                      child: Icon(
                        FontAwesomeIcons.alipay,
                        size: 50,
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: width * 0.29,
                    child: Card(
                      color: Color(0xff8DDEDE),
                      child: Icon(
                        FontAwesomeIcons.adversal,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
              Container(height: 400, child: Charts()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
