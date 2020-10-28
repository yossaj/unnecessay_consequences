import 'dart:math';

List<String> tweetList = [
  "Stick your job up your ass",
  "I quit",
  "You still not figured out who did that to your car?",
  "Your husband say hi",
  "needs to be cancelled",
  "how did this dipshit get a job",
  "I'm working for a total chomo"
];

String getRandomTweet(){
  int i = Random().nextInt(tweetList.length -1);
  return tweetList[i];
}