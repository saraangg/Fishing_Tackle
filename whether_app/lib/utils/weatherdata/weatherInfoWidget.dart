import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models.dart';

class WeatherInfoWidget extends StatelessWidget {
  final WeatherData weatherData;

  WeatherInfoWidget({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: _buildWeatherInfoContainer(
            icon: Icons.thermostat_outlined,
            label: 'Temperature',
            value: '${weatherData.temperature}',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: _buildWeatherInfoContainer(
            icon: Icons.water,
            label: 'Humidity',
            value: '${weatherData.humidity}',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: _buildWeatherInfoContainer(
            icon: Icons.air,
            label: 'Wind Speed',
            value: '${weatherData.windSpeed}',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: _buildWeatherInfoContainer(
            icon: Icons.cloud,
            label: 'Weather',
            value: '${weatherData.weatherCondition}',
          ),
        ),
        // Add more containers for additional weather data if needed
      ],
    );
  }

  Widget _buildWeatherInfoContainer({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade50,
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          SizedBox(width: 5),
          Text(
            '$label:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5),
          Text(value),
        ],
      ),
    );
  }
}
