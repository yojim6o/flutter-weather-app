import 'package:flutter/material.dart';
import 'package:weather_app/src/bloc/__weather_controller.dart';

class WeatherProvider extends InheritedWidget {
  final bloc = WeatherController();

  WeatherProvider({super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static WeatherController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<WeatherProvider>()!.bloc;
  }
}
