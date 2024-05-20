// models/weather_data.dart

class WeatherData {
  final double temperature;
  final int humidity;
  final double windSpeed;
  final String weatherCondition;

  WeatherData({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.weatherCondition,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperature: (json['main']['temp'] - 273.15).toDouble(),
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      weatherCondition: json['weather'][0]['main'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'humidity': humidity,
      'windSpeed': windSpeed,
      'weatherCondition': weatherCondition,
    };
  }
}