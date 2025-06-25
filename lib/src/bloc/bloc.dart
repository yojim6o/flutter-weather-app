import 'dart:async';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/services/weather_service.dart';

class Bloc {
  final String apiKey;
  late final WeatherService weatherService;

  Bloc(this.apiKey) {
    weatherService = WeatherService(apiKey: apiKey);
  }

  //controllers
  final StreamController<WeatherModel> _weatherController =
      StreamController.broadcast();
  final StreamController<List<ForecastItem>> _forecastController =
      StreamController<List<ForecastItem>>.broadcast();

  //streams
  Stream<WeatherModel> get weatherStream => _weatherController.stream;
  Stream<List<ForecastItem>> get forecastStream =>
      _forecastController.stream.asBroadcastStream();

  addForecast(List<ForecastItem> fl) {
    _forecastController.sink.add(fl);
  }

  fetchWeatherInfo() async {
    try {
      final weatherInfo = await weatherService.getWeather();
      _weatherController.sink.add(weatherInfo);
    } catch (e) {
      _weatherController.sink.addError(e);
    }
  }

  void dispose() {
    _weatherController.close();
    _forecastController.close();
  }
}
