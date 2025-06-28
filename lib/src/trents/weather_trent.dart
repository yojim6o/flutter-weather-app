// weather_Trent.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/repository/location_repository.dart';
import 'package:weather_app/src/repository/weather_repository.dart';
import 'package:weather_app/src/trents/connection_trent.dart';
import 'package:weather_app/src/trents/states/connection_state.dart';
import 'package:weather_app/src/trents/states/unit_state.dart';
import 'package:weather_app/src/trents/unit_trent.dart';
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

    /*  Rx.combineLatest2<ConnectionStatus, UnitState, bool>(
      get<ConnectionTrent>().stateStream,
      get<UnitTrent>().stateStream,
      (ConnectionStatus c, UnitState u) {
        print("WeatherTrent: combining two values, c $c, u $u");
        if (c is! ConnectionLoaded && u.unitMode == UnitMode.initial) {
          return false;
        }

        if (c is ConnectionLoaded && u.unitMode != UnitMode.initial) {
          return true;
        }

        if (c is ConnectionLoaded) {
          return true;
        }
        return false;
      },
    ).listen((bool value) {
      if (value) {
        print("WeatherTrent: Por lo tanto hago la llamada");
        _fetchWeatherInfo();
      }
    }); */
  }

  Future<void> _fetchWeatherInfo() async {
    debugPrint("WeatherTrent: Fetching info from weatherService");
    emit(WeatherLoading());

    try {
      final city = await _locationRepository.getCityName();
      final weather = await _weatherRepository.getForecast(city: city);
      emit(WeatherLoaded(weather: weather));
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
