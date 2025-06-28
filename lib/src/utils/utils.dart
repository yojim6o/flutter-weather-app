import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/trents/states/unit_state.dart';

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
    final inputWeekday = formatDate(dt, 'EEE');
    final inputHour = formatDate(dt, 'HH');
    final todayWeekday = formatDate(DateTime.now(), 'EEE');
    final tmrWeekday = formatDate(DateTime.now().add(Duration(days: 1)), 'EEE');

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

  static String formatDate(DateTime dt, String format) {
    return DateFormat(format).format(dt);
  }

  static String resolveCelsiusToFarenheit(double temp, UnitMode unitMode) {
    if (unitMode == UnitMode.imperial) {
      return '${((temp * 1.8) + 32).round()}';
    }
    return temp.round().toString();
  }

  static String resolveWindSpedd(double temp, UnitMode unitMode) {
    if (unitMode == UnitMode.imperial) {
      return '${(temp * 2.237).round()}';
    }
    return temp.round().toString();
  }

  static String resolveTempSymbol(UnitMode unitMode) {
    if (unitMode == UnitMode.imperial) {
      return 'Fº';
    }
    return 'Cº';
  }

  static String resolveSpeedSymbol(UnitMode unitMode) {
    if (unitMode == UnitMode.imperial) {
      return 'mph';
    }
    return 'm/s';
  }
}
