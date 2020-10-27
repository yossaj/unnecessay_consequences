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
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        RegistrationScreen.routeName :(context) => RegistrationScreen(),
        TimeScreen.routeName : (context) => TimeScreen()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white), bodyText2: TextStyle(color: Colors.white) )
      )
    );
  }
}

