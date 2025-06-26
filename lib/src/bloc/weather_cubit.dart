// weather_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/services/weather_service.dart';
import 'states/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService = WeatherService();

  WeatherCubit() : super(WeatherInitial());

  Future<void> fetchWeatherInfo() async {
    debugPrint("WeatherCubit: Fetching info from weatherService");
    emit(WeatherLoading());

    try {
      final weather = await weatherService.getWeather();
      emit(WeatherLoaded(weather: weather));
    } catch (e) {
      debugPrint("WeatherCubit: Error fetching weather info: $e");
      emit(WeatherError("Failed to fetch weather data"));
    }
  }
}
