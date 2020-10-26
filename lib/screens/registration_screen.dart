import 'package:flutter/material.dart';
import 'package:twitter_api/twitter_api.dart';
import 'package:unnecessary_consequences/keys.dart';

class RegistrationScreen extends StatefulWidget {


  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}


class _RegistrationScreenState extends State<RegistrationScreen> {

  final _twitterOauth = new twitterApi(
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      token: token,
      tokenSecret: tokenSecret
  );

  void triggerRequest() async{
    Future twitterRequest = _twitterOauth.getTwitterRequest(
    // Http Method
    "POST",
    // Endpoint you are trying to reach
    "statuses/update.json",
    // The options for the request
    options: {
    "status": "Testing for an app"// Used to prevent truncating tweets
    },
    );


// Wait for the future to finish
    var res = await twitterRequest;

// Print off the response
    print(res.statusCode);
    print(res.body);
  }


  @override
  void initState() {
    triggerRequest();
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

class RegTextField extends StatefulWidget {


  RegTextField({this.inputTitle});

  String inputTitle;

  @override
  _RegTextFieldState createState() => _RegTextFieldState();
}


class _RegTextFieldState extends State<RegTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.inputTitle),
          Container(
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
        ],
      ),
    );
  }
}

