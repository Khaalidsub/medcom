import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/blocs/hospital_blocs/hospital_navigation_bloc.dart';
import 'package:health_app/src/screens/widgets/hospital_widgets/hospital_bottom_navigation.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/screens/hospitalScreens/add_screen.dart';
import 'package:health_app/src/screens/hospitalScreens/history.dart';
import 'package:health_app/src/screens/hospitalScreens/home.dart';
import 'package:health_app/src/screens/hospitalScreens/profile.dart';
import 'package:health_app/src/screens/hospitalScreens/hospital_scan.dart';
import 'package:health_app/src/screens/widgets/progress_bar.dart';

class HospitalNavigation extends StatefulWidget {
  @override
  _HospitalMainState createState() => _HospitalMainState();
}

class _HospitalMainState extends State<HospitalNavigation> {
  final HospitalNavigationBloc _hospitalNavigationBloc =
      BlocProvider.getBloc<HospitalNavigationBloc>();
  int index = 0;
  void changeIndex(int val) {
    setState(() {
      this.index = val;
    });
  }

  List<Widget> page = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _hospitalNavigationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(Navigator.canPop(context));
      },
      child: StreamBuilder<Object>(
          stream: _hospitalNavigationBloc.streamUserData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Hospital hospital = snapshot.data;

              page.add(HospitalHome(hospital.id));
              page.add(AddScreen(hospital));
              page.add(HospitalHistory());
              page.add(ScanHospital());
              page.add(HospitalProfile(hospital));

              return Scaffold(
                body: IndexedStack(
                  children: page,
                  index: index,
                ),
                bottomNavigationBar:
                    BottomNavigation(changeIndex: changeIndex, index: index),
              );
            }
            return Scaffold(
              body: Column(
                children: <Widget>[
                  Center(
                    child: ProgressBar(
                      color: Colors.blueAccent,
                    ),
                  )
                ],
              ),
              bottomNavigationBar:
                  BottomNavigation(changeIndex: changeIndex, index: index),
            );
          }),
    );
  }
}
