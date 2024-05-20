import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:whether_app/weatherforecast/weatherforecast_controller.dart';

import '../utils/weatherdata/weatherInfoWidget.dart';

class WeatherForecastScreen extends GetView<WeatherForecastController> {
  final Map<String, String> weatherImageMap = {
    'clear': 'assets/3.jpg',
    'clouds': 'assets/1.jpg',
    'rain': 'assets/2.jpg',
    // Add more mappings for other weather conditions as needed
  };

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    String currentWeatherImage = 'assets/2.jpg'; // Default weather image

    if (controller.weatherData.value != null) {
      String weatherCondition = controller.weatherData.value!.weatherCondition.toLowerCase(); // Convert to lowercase
      currentWeatherImage = weatherImageMap.containsKey(weatherCondition)
          ? weatherImageMap[weatherCondition]!
          : currentWeatherImage;
    }

    return Scaffold(
      body: Stack(
        children:[
          Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              currentWeatherImage,
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 50),
                TextField(
                  controller: controller.searchController,
                  decoration: InputDecoration(
                    labelText: 'Enter City or Zip Code',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: controller.fetchWeatherData,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 20),
                Obx(() {
                  if (controller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller.weatherData.value != null) {
                    return WeatherInfoWidget(weatherData: controller.weatherData.value!);
                  } else if (controller.errorMessage.value.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        controller.errorMessage.value,
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                }),
                SizedBox(height: 20),
                // Display current weather image with full screen height
              ],
            ),
          ),
        ),
    ]
      ),
    );
  }
}
