import 'package:weather_app/src/models/temperature.dart';
import 'package:weather_app/src/models/weather/weather.dart';
import 'package:weather_app/src/models/wind_speed.dart';

/// Derived model class used in the UI
class WeatherData {
  WeatherData({
    required this.city,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.rainProbability,
    required this.mainCondition,
    required this.description,
    required this.date,
    required this.isDay,
  });

  factory WeatherData.from({
    required Weather weather,
    required int sunrise,
    required int sunset,
  }) {
    final DateTime weatherDate = DateTime.fromMillisecondsSinceEpoch(
      weather.dt * 1000,
    );

    final isDay =
        DateTime.fromMillisecondsSinceEpoch(sunrise * 1000).hour <=
            weatherDate.hour &&
        DateTime.fromMillisecondsSinceEpoch(sunset * 1000).hour >=
            weatherDate.hour;
    return WeatherData(
      city: '${weather.cityName ?? 'N/A'}, ${weather.sys.country ?? 'N/A'}',
      temp: Temperature.metric(weather.weatherParams.temp),
      feelsLike: Temperature.metric(weather.weatherParams.feelsLike),
      humidity: weather.weatherParams.humidity,
      windSpeed: WindSpeed.metric(weather.windInfo.speed),
      rainProbability: weather.rainProbability,
      mainCondition: weather.weatherInfo[0].main,
      description: weather.weatherInfo[0].description,
      date: weatherDate,
      isDay: isDay,
    );
  }

  final String city;
  final Temperature temp;
  final Temperature feelsLike;
  final double humidity;
  final WindSpeed windSpeed;
  final double rainProbability;
  final String mainCondition;
  final String description;
  final DateTime date;
  final bool isDay;
}
