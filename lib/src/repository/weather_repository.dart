import 'dart:convert';
import 'dart:io';

import 'package:weather_app/src/api/api.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRepository {
  Future<WeatherModel> getForecast({required String city});
}

class HttpWeatherRepository extends WeatherRepository {
  final OpenWeatherMapAPI api;
  final http.Client client;

  HttpWeatherRepository({required this.api, required this.client});
  @override
  Future<WeatherModel> getForecast({required String city}) => _getData(
    uri: api.forecast(city),
    builder: (data) => WeatherModel.fromJson(data),
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
