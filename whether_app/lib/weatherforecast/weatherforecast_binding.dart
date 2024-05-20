// weather_forecast_binding.dart

import 'package:get/get.dart';
import 'package:whether_app/weatherforecast/weatherforecast_controller.dart';

class WeatherForecastBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherForecastController>(() => WeatherForecastController());
  }
}