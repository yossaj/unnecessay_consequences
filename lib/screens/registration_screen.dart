import 'package:flutter/material.dart';
import 'package:twitter_api/twitter_api.dart';

class RegistrationScreen extends StatefulWidget {


  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}


class _RegistrationScreenState extends State<RegistrationScreen> {

  final _twitterOauth = new twitterApi(
      consumerKey: '',
      consumerSecret: '',
      token: '',
      tokenSecret: ''
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

