import 'dart:async';
import 'package:flutter/material.dart';

class TimeScreen extends StatefulWidget {


  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {

  Duration countDown;
  String countDownText = '00:00:00';

  @override
  void initState() {
    super.initState();
    setCountdown();
  }

  void setCountdown(){
    countDown = Duration(seconds: 40);

      var timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if(countDown.inSeconds > 0) {
          countDown -= Duration(seconds: 1);
          setState(() {
            countDownText = _formatDuration(countDown);
          });
        }else{
          timer.cancel();
        }
      });
  }

  void resetCountdownAndText(){
    backgroundColor = Colors.green;
    countDown = Duration(seconds: 0);
    countDownText = _formatDuration(countDown);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
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
              shadowColor = Colors.green.shade100;
              backgroundColor = Colors.green;
              resetCountdownAndText();
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
