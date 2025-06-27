// weather_cubit.dart
import 'dart:async';

import 'package:trent/trent.dart';
import 'package:weather_app/src/services/weather_service.dart';
import 'package:weather_app/src/trents/connection_trent.dart';
import 'package:weather_app/src/trents/states/connection_state.dart';
import 'states/weather_state.dart';

class WeatherTrent extends Trent<WeatherState> {
  final WeatherService weatherService = WeatherService();
  Timer? _refreshTimer;

  WeatherTrent() : super(WeatherInitial()) {
    _startListening();
  }

  void _startListening() {
    get<ConnectionTrent>().stateStream.listen((status) {
      if (status is ConnectionLoaded) {
        _fetchWeatherInfo();
      }
    });
  }

  Future<void> _fetchWeatherInfo() async {
    //debugPrint("WeatherCubit: Fetching info from weatherService");
    emit(WeatherLoading());

    try {
      final weather = await weatherService.getWeather();
      emit(WeatherLoaded(weather: weather));
      _restartRefreshTimer();
    } catch (e) {
      //debugPrint("WeatherCubit: Error fetching weather info: $e");
      emit(WeatherError("Failed to fetch weather data"));
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
