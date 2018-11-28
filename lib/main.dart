import 'package:flutter/material.dart';
import 'package:sii_patm/pages/SplashScreen.dart';
import 'package:sii_patm/pages/dashboard.dart';
import 'package:sii_patm/pages/MenuDrawer/contacts.dart';

void main() => runApp(MyApp());

var routes = <String, WidgetBuilder>{
  "/dashboard": (BuildContext context) => DashBoard(),
  "/contacts": (BuildContext context) => Contacts()
};

class MyApp extends StatelessWidget {
  /*
  final routes = <String, WidgetBuilder>{
    SplashScreen.tag: (context) => SplashScreen(),
  };
  */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SII',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Nunito',
      ),
      home: SplashScreen(),
      routes: routes,
    );
  }
}