// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherParamsImpl _$$WeatherParamsImplFromJson(Map<String, dynamic> json) =>
    _$WeatherParamsImpl(
      temp: (json['temp'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
    );

Map<String, dynamic> _$$WeatherParamsImplToJson(_$WeatherParamsImpl instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'humidity': instance.humidity,
      'feels_like': instance.feelsLike,
    };

_$WeatherInfoImpl _$$WeatherInfoImplFromJson(Map<String, dynamic> json) =>
    _$WeatherInfoImpl(
      main: json['main'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$WeatherInfoImplToJson(_$WeatherInfoImpl instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
    };

_$WindInfoImpl _$$WindInfoImplFromJson(Map<String, dynamic> json) =>
    _$WindInfoImpl(speed: (json['speed'] as num).toDouble());

Map<String, dynamic> _$$WindInfoImplToJson(_$WindInfoImpl instance) =>
    <String, dynamic>{'speed': instance.speed};

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      weatherParams: WeatherParams.fromJson(
        json['main'] as Map<String, dynamic>,
      ),
      weatherInfo:
          (json['weather'] as List<dynamic>)
              .map((e) => WeatherInfo.fromJson(e as Map<String, dynamic>))
              .toList(),
      windInfo: WindInfo.fromJson(json['wind'] as Map<String, dynamic>),
      rainProbability: (json['pop'] as num?)?.toDouble() ?? 0,
      dt: (json['dt'] as num).toInt(),
      cityName: json['name'] as String?,
      sys: SysInfo.fromJson(json['sys'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'main': instance.weatherParams,
      'weather': instance.weatherInfo,
      'wind': instance.windInfo,
      'pop': instance.rainProbability,
      'dt': instance.dt,
      'name': instance.cityName,
      'sys': instance.sys,
    };

_$SysInfoImpl _$$SysInfoImplFromJson(Map<String, dynamic> json) =>
    _$SysInfoImpl(
      sunrise: (json['sunrise'] as num?)?.toInt() ?? 0,
      sunset: (json['sunset'] as num?)?.toInt() ?? 0,
      country: json['country'] ?? "N/A",
    );

Map<String, dynamic> _$$SysInfoImplToJson(_$SysInfoImpl instance) =>
    <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'country': instance.country,
    };
