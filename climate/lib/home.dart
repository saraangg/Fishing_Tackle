

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatelessWidget {
  final WeatherService _weatherService = WeatherService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            WeatherSearchField(weatherService: _weatherService),
            SizedBox(height: 20),
            WeatherDisplay(weatherService: _weatherService),
          ],
        ),
      ),
    );
  }
}

class WeatherSearchField extends StatefulWidget {
  final WeatherService weatherService;

  WeatherSearchField({required this.weatherService});

  @override
  _WeatherSearchFieldState createState() => _WeatherSearchFieldState();
}

class _WeatherSearchFieldState extends State<WeatherSearchField> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _cityController,
      decoration: InputDecoration(
        hintText: 'Enter city name',
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Fetch weather data for entered city
            final city = _cityController.text;
            if (city.isNotEmpty) {
              widget.weatherService.fetchWeatherByCity(city);
            } else {
              Get.snackbar('Error', 'Please enter a city name');
            }
          },
        ),
      ),
    );
  }
}

class WeatherDisplay extends StatelessWidget {
  final WeatherService weatherService;

  WeatherDisplay({required this.weatherService});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherService>(
      builder: (controller) => controller.weatherData == null
          ? CircularProgressIndicator()
          : WeatherWidget(data: controller.weatherData!),
    );
  }
}

class WeatherService extends GetxController {
  final String apiKey = '2cb4b46d41795535d4a45f7213fe0ac6';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final RxMap _weatherData = {}.obs;

  Map? get weatherData => _weatherData?.value;
  

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


class WeatherWidget extends StatelessWidget {
final dynamic data;

WeatherWidget({required this.data});

@override
Widget build(BuildContext context) {
// Extract relevant weather information
String cityName = data['name'];
double temperature = data['main']['temp'];
int humidity = data['main']['humidity'];
double windSpeed = data['wind']['speed'];
String weatherCondition = data['weather'][0]['main'];
String iconCode = data['weather'][0]['icon'];

return Column(
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Text(
'Weather in $cityName',
style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
),
SizedBox(height: 20),
Image.network(
'https://openweathermap.org/img/wn/$iconCode.png',
scale: 2,
),
SizedBox(height: 20),
Text(
'$temperature°C',
style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
),
Text('Humidity: $humidity%'),
Text('Wind Speed: $windSpeed m/s'),
Text('Weather Condition: $weatherCondition'),
],
);
}
}