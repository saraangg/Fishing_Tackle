
import 'dart:math';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';


const String apiKey = 'ab5e98d8ec1dc57f88667445bc5a429d';

class NetworkHelper extends ChangeNotifier {
  Future getData(String location) async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey'),
    );
    if (response.statusCode == 200) {
      String data = response.body;

      return WeatherAppModel.fromJson(jsonDecode(data));
    } else {
      log(response.statusCode);
    }
  }
}
