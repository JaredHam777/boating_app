
class WeatherData {



 final String time;
 final String precipIntensity;
 final String precipProb;
 final String precipType;
 final String temp;
 final String humidity;
 final String windSpeed;
 final String windGust;

  WeatherData({
    this.time,
    this.precipIntensity,
    this.precipProb,
    this.precipType,
    this.temp,
    this.humidity,
    this.windSpeed,
    this.windGust,
});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return new WeatherData(
      time: json['time'].toString(),
      precipIntensity: json['precipIntensity'].toString(),
      precipProb: json['precipProbability'].toString(),
      precipType: json['precipType'].toString(),
      temp: json['temperature'].toString(),
      humidity: json['humidity'].toString(),
      windSpeed: json['windSpeed'].toString(),
      windGust: json['windGust'].toString(),
    );
  }





}

class HourlyData  {
  final List<WeatherData> weatherDataPoints;

  HourlyData({
    this.weatherDataPoints,
});



  factory HourlyData.fromJson(List<dynamic> parsedJson) {

    List<WeatherData> weatherDataPoints = new List<WeatherData>();
    weatherDataPoints = parsedJson.map((i)=>WeatherData.fromJson(i)).toList();

    return new HourlyData(
      weatherDataPoints: weatherDataPoints
    );
  }

}

class Hourly  {
  final HourlyData Hdata;

  Hourly({
    this.Hdata
});

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return new Hourly(
     Hdata: HourlyData.fromJson(json["data"])
    );
  }



}

class RawJson {
  final Hourly hourly;

  RawJson({
    this.hourly
});
  factory RawJson.fromJson(Map<String, dynamic> json) {

    return new RawJson(
        hourly: Hourly.fromJson(json['hourly'])
    );
  }


}