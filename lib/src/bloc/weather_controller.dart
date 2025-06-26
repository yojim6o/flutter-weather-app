import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/services/weather_service.dart';

class WeatherController extends GetxController {
  final WeatherService weatherService = WeatherService();

  WeatherController() {
    _init();
  }

  void _init() {
    debugPrint("WeatherController: Initializing");
    fetchWeatherInfo();
  }

  // Reactive state
  final Rx<WeatherModel?> weather = Rx<WeatherModel?>(null);
  final RxList<ForecastItem> forecastList = <ForecastItem>[].obs;
  final RxBool isLoading = true.obs;
  final Rxn<String> error = Rxn<String>();

  Future<void> fetchWeatherInfo() async {
    isLoading.value = true;
    error.value = null;
    try {
      debugPrint("WeatherController: Fetching info from weatherService");
      final weatherInfo = await weatherService.getWeather();
      weather.value = weatherInfo;
    } catch (e) {
      debugPrint(
        "WeatherController: An error occured while fetching data in weatherService",
      );
      error.value = 'Error during data fetching: $e';
      weather.value = null;
    } finally {
      isLoading.value = false;
    }
  }

  // Set forecast list
  void addForecast(List<ForecastItem> list) {
    forecastList.assignAll(list);
  }
}
