// weather_service.dart
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherService extends GetxController {
  final String apiKey = '2cb4b46d41795535d4a45f7213fe0ac6';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final RxMap<String, dynamic>? _weatherData = {}.obs;

  Map<String, dynamic>? get weatherData => _weatherData?.value;

  @override
  void onInit() {
    super.onInit();
    fetchWeatherByCurrentLocation();
  }

  Future<void> fetchWeatherByCurrentLocation() async {
    try {
      final Position position = await _determinePosition();
      final List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
      final String city = placemarks.first.locality ?? '';
      await fetchWeatherByCity(city);
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  Future<void> fetchWeatherByCity(String city) async {
    final response = await http.get('$baseUrl?q=$city&appid=$apiKey' as Uri);
    if (response.statusCode == 200) {
      _weatherData!.value = json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled.';
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      throw 'Location permissions are permanently denied, we cannot request permissions.';
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        throw 'Location permissions are denied (actual value: $permission).';
      }
    }

    return await Geolocator.getCurrentPosition();
  }
}