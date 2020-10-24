import 'package:flutter/material.dart';

class TimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Container(
          child: Text(
            'TimeScreen',
          style: TextStyle(
            color: Colors.white
          ),),
        ),
      ),
    );
  }
}
