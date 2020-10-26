import 'dart:async';
import 'package:flutter/material.dart';
import 'package:unnecessary_consequences/helpers/time_formatter.dart';
import 'package:unnecessary_consequences/models/twitter_requests.dart';

class TimeScreen extends StatefulWidget {


  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {

  Duration countDown;
  String countDownText = '00:00:00';
  Timer timer;

  @override
  void initState() {
    super.initState();
    setCountdown();
  }

  void setCountdown(){
    countDown = Duration(seconds: 10);
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if(countDown.inSeconds > 0) {
          countDown -= Duration(seconds: 1);
          setState(() {
            countDownText = formatDuration(countDown);
          });
        }else if(countDown.inSeconds == 0){
          timer.cancel();
          triggerRequest();
        }
      });
  }

  void resetCountdownStateOnClick(){
    backgroundColor = Colors.green;
    countDown = Duration(seconds: 0);
    countDownText = formatDuration(countDown);
    shadowColor = Colors.green.shade100;
    backgroundColor = Colors.green;
    timer.cancel();
  }

  Color backgroundColor = Colors.red;
  Color shadowColor = Colors.red.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FlatButton(
          shape: CircleBorder(),
          onPressed: (){
            setState(() {
              resetCountdownStateOnClick();
            });

          },
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(150),
              boxShadow: [BoxShadow(
                  color: shadowColor,
                  spreadRadius: 8,
                  blurRadius: 4,
              )]
            ),
            child: Center(
              child: Text(
                countDownText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 58
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
