import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/src/models/weather_model.dart';

class Utils {
  static Widget getWeatherAnimation(String description, bool isDay) {
    String momentOfDay = isDay ? 'day' : 'night';
    switch (description.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return Lottie.asset('assets/$momentOfDay/cloudy.json');
      case 'rain':
      case 'shower rain':
        return Lottie.asset('assets/$momentOfDay/rainy.json');
      case 'thunderstorm':
        return Lottie.asset('assets/$momentOfDay/thunder.json');
      default:
        return Lottie.asset('assets/$momentOfDay/clear.json');
    }
  }

  static String formatDateToWheelItem(DateTime dt) {
    final inputWeekday = DateFormat('EEE').format(dt);
    final inputHour = DateFormat('HH').format(dt);
    final todayWeekday = DateFormat('EEE').format(DateTime.now());
    final tmrWeekday = DateFormat(
      'EEE',
    ).format(DateTime.now().add(Duration(days: 1)));

    if (todayWeekday == inputWeekday) {
      return 'Today, ${inputHour}h';
    }
    if (tmrWeekday == inputWeekday) {
      return 'Tmr, ${inputHour}h';
    }
    return '$inputWeekday, ${inputHour}h';
  }

  static Map<String, List<ForecastItem>> mapWeatherToForecastItems(
    WeatherModel weatherModel,
  ) {
    return groupBy(
      weatherModel.forecastList,
      (f) => formatDateToWheelItem(f.dt),
    );
  }
}
