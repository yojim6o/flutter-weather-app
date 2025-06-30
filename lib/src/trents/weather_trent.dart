import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/models/weather/weather_data.dart';
import 'package:weather_app/src/repository/weather_repository.dart';
import 'package:weather_app/src/trents/city_trent.dart';
import 'states/weather_state.dart';

class WeatherTrent extends Trent<WeatherState> {
  final WeatherRepository _weatherRepository;
  Timer? _refreshTimer;

  WeatherTrent(this._weatherRepository) : super(WeatherLoading()) {
    _startListening();
  }

  void _startListening() {
    get<CityTrent>().stateStream.listen((status) {
      if (status is CityLoaded) {
        _fetchWeatherInfo(status.city);
        _restartRefreshTimer(status.city);
      } else if (status is CityLoading) {
        emit(WeatherLoading());
      }
    });
  }

  Future<void> _fetchWeatherInfo(String city) async {
    debugPrint("WeatherTrent: Fetching weather info from weatherRepository");
    emit(WeatherLoading());

    try {
      final weatherInfo = await _weatherRepository.getWeather(city: city);
      Future.delayed(Duration(seconds: 3), () {
        emit(
          WeatherLoaded(
            data: WeatherData.from(
              weather: weatherInfo,
              sunrise: weatherInfo.sys.sunrise,
              sunset: weatherInfo.sys.sunset,
            ),
          ),
        );
      });
    } catch (e) {
      debugPrint("WeatherTrent: Error fetching weather info: $e");
      emit(WeatherError('$e'));
    }
  }

  void _restartRefreshTimer(String city) {
    _refreshTimer?.cancel(); // Cancel if exists
    _refreshTimer = Timer.periodic(
      Duration(minutes: 5),
      (_) => _fetchWeatherInfo(city),
    );
  }

  void resetState() {
    reset();
  }
}
