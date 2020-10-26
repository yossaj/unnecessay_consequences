import 'package:flutter/material.dart';
import 'components/registration_textfield.dart';
class RegistrationScreen extends StatefulWidget {


  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}


class _RegistrationScreenState extends State<RegistrationScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RegTextField(inputTitle: 'Your Twitter handle',),
          RegTextField(inputTitle: 'Your boss\'s or loved one\'s Twitter handle'),
          RegTextField(inputTitle: 'Another input',),
          Container(
            padding:  EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: FlatButton(
              child: Text('Next'),
              onPressed: (){
                Navigator.pushNamed(context, '3');
              },
            ),
            decoration: BoxDecoration(
              color: Color(0x44F16C6C),
              borderRadius: BorderRadius.circular(5),

            ),
          )
        ],
      ),
    );
  }
}


