import 'dart:convert';

import 'package:blac1/HTMLParse.dart';
import 'package:blac1/HTMLTable.dart';
import 'package:blac1/jsonStucture.dart';
import 'package:http/http.dart' as http;






class Post {

  static void readPost(Future<Post> post) async  {
    Post p = await post;
    print("TIME: " + p.time);
  }

  static String apiKey = "af00533ac95e72558320feefd616bba4";
  static String laditude = "45.0547";
  static String longitude = "-93.4360";


  final String time;

  Post({this.time});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      time:  json['time']


    );
  }

   static Future<Post> fetchPost() async {
    var now = new DateTime.now();





    print("current time: " + now.millisecondsSinceEpoch.toString());

    final response = await http.get('https://api.darksky.net/forecast/' + apiKey + '/' + laditude + ',' + longitude +','+ ((now.millisecondsSinceEpoch/1000).round()).toString());
    print('https://api.darksky.net/forecast/' + apiKey + '/' + laditude + ',' + longitude +','+((now.millisecondsSinceEpoch/1000).round()).toString());
    print("RAW: " + response.body);

   // Map weatherMap = jsonDecode(response.body);

    //Map data = jsonDecode(response.body);

    print("getting hourly...");
   RawJson raw = RawJson.fromJson(jsonDecode(response.body));
    print("wind speed: " + raw.hourly.Hdata.weatherDataPoints[0].windSpeed);


 //   var weather = WeatherData.fromJson(weatherMap);


  //  print("i think the lat is ${weather.latitude}");

  //  print("json: " + jsonDecode(response.body));
 //   return(jsonDecode(response.body));
  }

}









