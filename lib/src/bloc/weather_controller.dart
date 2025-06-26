import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/services/weather_service.dart';

class WeatherController {
  final WeatherService weatherService = WeatherService();

  final _weatherController = PublishSubject<WeatherModel>();
  Stream<WeatherModel> get weatherStream => _weatherController.stream;
  void Function(WeatherModel) get addWeather => _weatherController.sink.add;

  final _forecastController = PublishSubject<List<ForecastItem>>();
  Stream<List<ForecastItem>> get forecastStream => _forecastController.stream;
  void Function(List<ForecastItem>) get addForecast =>
      _forecastController.sink.add;

  WeatherController() {
    _init();
  }

  void _init() {
    debugPrint("WeatherController: Initializing");
    fetchWeatherInfo();
  }

  Future<void> fetchWeatherInfo() async {
    try {
      debugPrint("WeatherController: Fetching info from weatherService");
      final weatherInfo = await weatherService.getWeather();
      _weatherController.sink.add(weatherInfo);
    } catch (e) {
      debugPrint(
        "WeatherController: An error occured while fetching data in weatherService",
      );
      _weatherController.sink.addError(e);
    }
  }
}
