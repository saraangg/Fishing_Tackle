import 'package:get/get.dart';

import '../models/weather_model.dart';
import '../utils/api.dart';


class WeatherController extends GetxController {
  RxString location = 'Beypore'.obs;

  // Weather data
  Rx<WeatherAppModel> weatherData = WeatherAppModel().obs;

  // Function to fetch weather data
  Future<void> fetchWeatherData({required String location}) async {
    try {
      final networkHelper = NetworkHelper();
      final data = await networkHelper.getData(location);
      weatherData.value = data;
    } catch (e) {
      print(e.toString());
    }
  }

  // Function to update location
  void updateLocation(String newLocation) {
    location.value = newLocation;
    fetchWeatherData(location: newLocation);
  }
}