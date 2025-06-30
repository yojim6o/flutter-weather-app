import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/models/weather/weather_data.dart';
import 'package:weather_app/src/repository/location_repository.dart';
import 'package:weather_app/src/repository/weather_repository.dart';
import 'package:weather_app/src/trents/connection_trent.dart';
import 'package:weather_app/src/trents/states/connection_state.dart';
import 'states/weather_state.dart';

class WeatherTrent extends Trent<WeatherState> {
  final WeatherRepository _weatherRepository;
  final LocationRepository _locationRepository;
  Timer? _refreshTimer;

  WeatherTrent(this._weatherRepository, this._locationRepository)
    : super(WeatherInitial()) {
    _startListening();
  }

  void _startListening() {
    get<ConnectionTrent>().stateStream.listen((status) {
      if (status is ConnectionLoaded) {
        _fetchWeatherInfo();
        _restartRefreshTimer();
      }
    });

    /* get<UnitTrent>().stateStream.listen((unit) {
      print("Weather Trent: Listening UnitTrent value $unit");
      _fetchWeatherInfo();
      _restartRefreshTimer();
    }); */
  }

  Future<void> _fetchWeatherInfo() async {
    debugPrint("WeatherTrent: Fetching info from weatherService");
    emit(WeatherLoading());

    try {
      final city = await _locationRepository.getCityName();
      final weatherInfo = await _weatherRepository.getWeather(city: city);
      emit(
        WeatherLoaded(
          data: WeatherData.from(
            weather: weatherInfo,
            sunrise: weatherInfo.sys.sunrise,
            sunset: weatherInfo.sys.sunset,
          ),
        ),
      );
    } catch (e) {
      debugPrint("WeatherTrent: Error fetching weather info: $e");
      emit(WeatherError('$e'));
    }
  }

  void _restartRefreshTimer() {
    _refreshTimer?.cancel(); // Cancel if exists
    _refreshTimer = Timer.periodic(
      Duration(minutes: 5),
      (_) => _fetchWeatherInfo(),
    );
  }

  void resetState() {
    reset();
  }
}
