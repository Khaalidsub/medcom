import 'package:flutter/material.dart';
import 'package:health_app/src/utils/routing.dart';
// import 'package:health_app/src/screens/splash_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Widget changePage(BuildContext context) {
  //   return WelcomingScreen();
  // }

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      // home: buildSplashScreen(),
      navigatorKey: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        //creating instance of hospital routing to return the materialPage route.
        Routes routing = Routes();
        return routing.routing(settings, context);
      },
    );
  }
}
