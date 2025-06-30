import 'package:weather_app/src/models/forecast/forecast.dart';
import 'package:weather_app/src/models/weather/weather_data.dart';

/// Derived model class used in the UI
class ForecastData {
  const ForecastData(this.list);
  factory ForecastData.from(Forecast forecast) {
    return ForecastData(
      forecast.list
          .map(
            (item) => WeatherData.from(
              weather: item,
              sunrise: forecast.city.sunrise,
              sunset: forecast.city.sunset,
            ),
          )
          .toList(),
    );
  }
  final List<WeatherData> list;
}
