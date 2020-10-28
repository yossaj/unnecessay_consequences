import 'dart:async';
import 'package:flutter/material.dart';
import 'package:unnecessary_consequences/helpers/time_formatter.dart';
import 'package:unnecessary_consequences/models/twitter_requests.dart';
import 'package:unnecessary_consequences/helpers/tweet_selector.dart';
import 'components/screen_arguments.dart';

class TimeScreen extends StatefulWidget {

  TimeScreen(this.arguments);

  final ScreenArguments arguments;


  static const routeName = '/timer';

  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {

  Duration countDown;
  String countDownText = '00:00:00';
  Timer timer;
  List<String> args;
  bool warningVisibility = false;
  String tweet;
  String bossHandle;

  @override
  void initState() {
    super.initState();
    setCountdown();
    bossHandle = this.widget.arguments.bossHandle;
    tweet = bossHandle + " " + getRandomTweet();
  }

  void setCountdown(){
    countDown = Duration(seconds: 10);
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if(countDown.inSeconds > 0) {
          countDown -= Duration(seconds: 1);
          setState(() {
            countDownText = formatDuration(countDown);
          });
          if(countDown.inSeconds <= 5)  warningVisibility = true;
        }else if(countDown.inSeconds == 0){
          timer.cancel();
          triggerRequest(tweet: tweet);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              shape: CircleBorder(),
              onPressed: (){
                setState(() {
                  warningVisibility = false;
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
            SizedBox(
              height: 100,
            ),
            Visibility(
              visible: warningVisibility,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    Text("Press the button now!", style: TextStyle(fontSize: 20, ),),
                    Text('We will tweet', style: TextStyle(fontWeight: FontWeight.w100),),
                    Text(tweet),
                    Text(bossHandle, style: TextStyle(fontWeight: FontWeight.w100),)
                  ],
                ),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [BoxShadow(
                    color: shadowColor,
                    spreadRadius: 4,
                    blurRadius: 4,
                  )]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
