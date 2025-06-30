import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

// ignore_for_file:invalid_annotation_target
@freezed
class WeatherParams with _$WeatherParams {
  factory WeatherParams({
    required double temp,
    required double humidity,
    @JsonKey(name: 'feels_like') required double feelsLike,
  }) = _WeatherParams;

  factory WeatherParams.fromJson(Map<String, dynamic> json) =>
      _$WeatherParamsFromJson(json);
}

@freezed
class WeatherInfo with _$WeatherInfo {
  factory WeatherInfo({required String main, required String description}) =
      _WeatherInfo;

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);
}

@freezed
class WindInfo with _$WindInfo {
  factory WindInfo({required double speed}) = _WindInfo;

  factory WindInfo.fromJson(Map<String, dynamic> json) =>
      _$WindInfoFromJson(json);
}

/// Weather data parsed from the API response (not used directly in the UI)
@freezed
class Weather with _$Weather {
  factory Weather({
    @JsonKey(name: 'main') required WeatherParams weatherParams,
    @JsonKey(name: 'weather') required List<WeatherInfo> weatherInfo,
    @JsonKey(name: 'wind') required WindInfo windInfo,
    @Default(0) @JsonKey(name: 'pop') double rainProbability,
    required int dt,
    @JsonKey(name: 'name') String? cityName,
    required SysInfo sys,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
class SysInfo with _$SysInfo {
  factory SysInfo({
    @Default(0) int sunrise,
    @Default(0) int sunset,
    @Default("N/A") country,
  }) = _SysInfo;

  factory SysInfo.fromJson(Map<String, dynamic> json) =>
      _$SysInfoFromJson(json);
}
