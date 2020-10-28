import 'package:twitter_api/twitter_api.dart';
import 'package:unnecessary_consequences/keys.dart';

final _twitterOauth = new twitterApi(
    consumerKey: consumerKey,
    consumerSecret: consumerSecret,
    token: token,
    tokenSecret: tokenSecret
);

void triggerRequest({tweet : String}) async{
  Future twitterRequest = _twitterOauth.getTwitterRequest(
    // Http Method
    "POST",
    "statuses/update.json",
    options: {
      "status": tweet
    },
  );


  var res = await twitterRequest;

  print(res.statusCode);
  print(res.body);
}



