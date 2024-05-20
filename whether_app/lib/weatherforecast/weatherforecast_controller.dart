import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/weatherdata/models.dart';

class WeatherForecastController extends GetxController {
  Rx<WeatherData?> weatherData = Rx<WeatherData?>(null);
  RxString errorMessage = ''.obs;
  TextEditingController searchController = TextEditingController();
  String apiKey = 'ab5e98d8ec1dc57f88667445bc5a429d';
  RxBool isLoading = false.obs; // Loading indicator

  @override
  void onInit() {
    super.onInit();
    // Load cached data
    loadCachedData();
    // Fetch weather data for current location when the app opens
    getCurrentLocationWeather();
  }

  void fetchWeatherData() async {
    String query = searchController.text.trim();
    if (query.isEmpty) return;

    isLoading.value = true; // Show loading indicator
    errorMessage.value = ''; // Clear previous error messages

    // Check if the query is a location or a city name
    if (query.contains(',')) {
      List<String> location = query.split(',');
      double latitude = double.tryParse(location[0]) ?? 0.0;
      double longitude = double.tryParse(location[1]) ?? 0.0;
      await _fetchWeatherDataByLocation(latitude, longitude);
    } else {
      await _fetchWeatherDataByCityName(query);
    }
  }

  Future<void> _fetchWeatherDataByLocation(double latitude, double longitude) async {
    final url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
    await _fetchWeatherData(url);
  }

  Future<void> _fetchWeatherDataByCityName(String cityName) async {
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';
    await _fetchWeatherData(url);
  }

  Future<void> _fetchWeatherData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        weatherData.value = WeatherData.fromJson(jsonData);
        saveDataToCache();
      } else {
        errorMessage.value = 'Error fetching weather data. Please try again.';
      }
    } catch (e) {
      errorMessage.value = 'Error fetching weather data. Please check your internet connection.';
    } finally {
      isLoading.value = false; // Hide loading indicator
    }
  }

  Future<void> getCurrentLocationWeather() async {
    try {
      isLoading.value = true; // Show loading indicator
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double latitude = position.latitude;
      double longitude = position.longitude;
      await _fetchWeatherDataByLocation(latitude, longitude);
    } catch (e) {
      errorMessage.value = 'Error getting current location. Please check your location settings.';
    } finally {
      isLoading.value = false; // Hide loading indicator
    }
  }

  void loadCachedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedData = prefs.getString('cached_weather_data');
    if (cachedData != null) {
      final jsonData = json.decode(cachedData);
      weatherData.value = WeatherData.fromJson(jsonData);
    }
  }

  void saveDataToCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cached_weather_data', json.encode(weatherData.value!.toJson()));
  }
}
