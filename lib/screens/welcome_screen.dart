import 'package:flutter/material.dart';
import 'package:animated_text_kit/src/text_liquid_fill.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: TextLiquidFill(
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