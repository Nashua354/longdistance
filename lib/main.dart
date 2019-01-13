import 'package:flutter/material.dart';
import 'package:longdistance/screens/dashboard.dart';
import 'package:longdistance/screens/loginPage.dart';
import 'package:longdistance/screens/settings.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final Map<String, WidgetBuilder> routes = {
    '/dashboard': (BuildContext context) => DashboardPage(),
    '/loginpage': (BuildContext context) => LoginPage(),
    '/settings': (BuildContext context) => Settings()
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData.dark(),
        // ThemeData(
        //   brightness: Brightness.dark,
        //   primaryColor: Colors.black,
        //   accentColor: Colors.cyan[600],
        //   fontFamily: 'Montserrat',
        //   textTheme: TextTheme(
        //     headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //     //title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //     body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        //   ),
        // ),
        home: new LoginPage(),
        routes: routes);
  }
}
