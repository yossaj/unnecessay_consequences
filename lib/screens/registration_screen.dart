import 'package:flutter/material.dart';
import 'package:unnecessary_consequences/screens/time_screen.dart';
import 'components/registration_textfield.dart';
class RegistrationScreen extends StatefulWidget {

  static const routeName = '/registration';


  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}


class _RegistrationScreenState extends State<RegistrationScreen> {

  String userTwitterHandle;
  String bossTwitterHandle;

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
          RegTextField(
            inputTitle: 'Your Twitter handle',
            onChanged: (String text){userTwitterHandle = text;},
          ),
          RegTextField(
            inputTitle: 'Your boss\'s or loved one\'s Twitter handle',
            onChanged: (String text){ bossTwitterHandle = text;},
          ),
          Container(
            padding:  EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: FlatButton(
              child: Text('Next'),
              onPressed: (){
                print("$userTwitterHandle & $bossTwitterHandle ");
                Navigator.pushNamed(context, TimeScreen.routeName, arguments: [userTwitterHandle, bossTwitterHandle]);
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


