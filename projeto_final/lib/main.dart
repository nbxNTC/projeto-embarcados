import 'package:flutter/material.dart';
import 'package:projeto_final/home.dart';
import 'package:projeto_final/options.dart';
import 'package:projeto_final/registerEmail.dart';
import 'package:projeto_final/removeEmail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoorBell',
      theme: ThemeData( primarySwatch: Colors.cyan, ),
      home: Home(),
      initialRoute: '/home',
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => Home(),
        '/registeremail' : (BuildContext context) => RegisterEmail(),
        '/removeemail' : (BuildContext context) => RemoveEmail(),
        '/options' : (BuildContext context) => Options(),
      },

    );
  }

}