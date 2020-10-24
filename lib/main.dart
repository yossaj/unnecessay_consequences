import 'package:flutter/material.dart';
import 'package:unnecessary_consequences/screens/registration_screen.dart';
import 'package:unnecessary_consequences/screens/time_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '1',
      routes: {
        '1' : (context) => WelcomeScreen(),
        '2' :(context) => RegistrationScreen(),
        '3' : (context) => TimeScreen()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      )
    );
  }
}

