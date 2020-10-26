import 'package:flutter/material.dart';
import 'package:animated_text_kit/src/text_liquid_fill.dart';
import 'dart:async';

import 'package:unnecessary_consequences/screens/registration_screen.dart';


class WelcomeScreen extends StatefulWidget {

  static const routeName = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushNamed(context, RegistrationScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: TextLiquidFill(
              loadDuration: Duration(seconds: 3),
              textAlign: TextAlign.center,
              text: 'Unnecessary Consequences',
              waveColor: Colors.white,
              boxBackgroundColor: Colors.red,
              textStyle: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 300.0,
            ),
          ),
        ),
      ),
    );
  }
}


//Unnecessary Consequences