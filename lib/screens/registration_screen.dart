import 'package:flutter/material.dart';
import 'package:unnecessary_consequences/screens/components/screen_arguments.dart';
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

  bool validHandles(){
    return userTwitterHandle.isNotEmpty && bossTwitterHandle.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RegTextField(
            inputTitle: 'Your Twitter handle',
            onChanged: (String text){userTwitterHandle = text;},
          ),
          RegTextField(
            inputTitle: 'Your boss\'s or loved one\'s Twitter handle',
            onChanged: (String text){ bossTwitterHandle = text;},
          ),
          SizedBox(
            height: 150,
          ),
          Container(
            padding:  EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: FlatButton(
              child: Text('Next'),
              onPressed: (){
                if(validHandles()){
                  Navigator.pushNamed(context,
                      TimeScreen.routeName,
                      arguments: ScreenArguments(
                          userTwitterHandle,
                          bossTwitterHandle));
                }
              },
            ),
            decoration: BoxDecoration(
              color: Color(0x44F16C6C),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}


