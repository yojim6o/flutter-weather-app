library;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/models/weather/weather.dart';

part 'forecast.g.dart';
part 'forecast.freezed.dart';

/// Forecast data parsed from the API response (not used directly in the UI)
@freezed
class Forecast with _$Forecast {
  factory Forecast({required List<Weather> list, required CityInfo city}) =
      _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}

@freezed
class CityInfo with _$CityInfo {
  factory CityInfo({
    required String name,
    required String country,
    required int sunrise,
    required int sunset,
  }) = _CityInfo;

  factory CityInfo.fromJson(Map<String, dynamic> json) =>
      _$CityInfoFromJson(json);
}
