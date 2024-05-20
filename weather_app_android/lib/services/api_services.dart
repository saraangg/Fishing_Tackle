import 'package:http/http.dart';

import '../const/strings.dart';
import '../models/current_weather.dart';
import '../models/hourly_weather.dart';

getCurrentWeather(lat, long) async{
  var link = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=$units";
  final res = await get(Uri.parse(link));

  if(res.statusCode == 200){
    var data = currentWeatherDataFromJson(res.body.toString());
    print("Data is received");
    return data;
  }
}

getHourlyWeather(lat, long) async{
  var hourlyLink = "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=$apiKey&units=$units";
  final res = await get(Uri.parse(hourlyLink));

  if(res.statusCode == 200){
    var data = hourlyWeatherDataFromJson(res.body.toString());
    print("hourly data is received");
    return data;
  }
}