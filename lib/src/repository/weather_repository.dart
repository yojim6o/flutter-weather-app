import 'dart:convert';
import 'dart:io';
import 'package:weather_app/src/api/api.dart';
import 'package:weather_app/src/models/forecast/forecast.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/models/weather/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather({required String city});
  Future<Forecast> getForecast({required String city});
}

class HttpWeatherRepository extends WeatherRepository {
  final OpenWeatherMapAPI api;
  final http.Client client;

  HttpWeatherRepository({required this.api, required this.client});
  @override
  Future<Forecast> getForecast({required String city}) => _getData(
    uri: api.forecast(city),
    builder: (data) => Forecast.fromJson(data),
  );

  @override
  Future<Weather> getWeather({required String city}) => _getData(
    uri: api.weather(city),
    builder: (data) => Weather.fromJson(data),
  );

  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);

        default:
          throw Error();
      }
    } on SocketException catch (_) {
      throw Error();
    }
  }
}
