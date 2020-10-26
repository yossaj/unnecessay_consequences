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

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(150),
            boxShadow: [BoxShadow(
                color: Colors.red.shade100,
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
    );
  }
}
