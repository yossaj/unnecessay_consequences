import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RegTextField(),
          RegTextField(),
          RegTextField(),
          FlatButton(
            child: Text('Next'),
            onPressed: (){
              Navigator.pushNamed(context, '3');
            },
          )
        ],
      ),
    );
  }
}

class RegTextField extends StatefulWidget {
  @override
  _RegTextFieldState createState() => _RegTextFieldState();
}

class _RegTextFieldState extends State<RegTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Container(
        padding: EdgeInsets.only(bottom: 20, left: 8, right: 8),
        child: TextField(
          style: TextStyle(
            fontSize: 20
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0x44F16C6C),
          borderRadius: BorderRadius.circular(5),

        ),

      ),
    );
  }
}

