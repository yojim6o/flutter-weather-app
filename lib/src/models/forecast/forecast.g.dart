// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForecastImpl _$$ForecastImplFromJson(Map<String, dynamic> json) =>
    _$ForecastImpl(
      list:
          (json['list'] as List<dynamic>)
              .map((e) => Weather.fromJson(e as Map<String, dynamic>))
              .toList(),
      city: CityInfo.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ForecastImplToJson(_$ForecastImpl instance) =>
    <String, dynamic>{'list': instance.list, 'city': instance.city};

_$CityInfoImpl _$$CityInfoImplFromJson(Map<String, dynamic> json) =>
    _$CityInfoImpl(
      name: json['name'] as String,
      country: json['country'] as String,
      sunrise: (json['sunrise'] as num).toInt(),
      sunset: (json['sunset'] as num).toInt(),
    );

Map<String, dynamic> _$$CityInfoImplToJson(_$CityInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
