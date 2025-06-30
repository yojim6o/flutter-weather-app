// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return _Forecast.fromJson(json);
}

/// @nodoc
mixin _$Forecast {
  List<Weather> get list => throw _privateConstructorUsedError;
  CityInfo get city => throw _privateConstructorUsedError;

  /// Serializes this Forecast to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Forecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForecastCopyWith<Forecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastCopyWith<$Res> {
  factory $ForecastCopyWith(Forecast value, $Res Function(Forecast) then) =
      _$ForecastCopyWithImpl<$Res, Forecast>;
  @useResult
  $Res call({List<Weather> list, CityInfo city});

  $CityInfoCopyWith<$Res> get city;
}

/// @nodoc
class _$ForecastCopyWithImpl<$Res, $Val extends Forecast>
    implements $ForecastCopyWith<$Res> {
  _$ForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Forecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? list = null, Object? city = null}) {
    return _then(
      _value.copyWith(
            list:
                null == list
                    ? _value.list
                    : list // ignore: cast_nullable_to_non_nullable
                        as List<Weather>,
            city:
                null == city
                    ? _value.city
                    : city // ignore: cast_nullable_to_non_nullable
                        as CityInfo,
          )
          as $Val,
    );
  }

  /// Create a copy of Forecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CityInfoCopyWith<$Res> get city {
    return $CityInfoCopyWith<$Res>(_value.city, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForecastImplCopyWith<$Res>
    implements $ForecastCopyWith<$Res> {
  factory _$$ForecastImplCopyWith(
    _$ForecastImpl value,
    $Res Function(_$ForecastImpl) then,
  ) = __$$ForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Weather> list, CityInfo city});

  @override
  $CityInfoCopyWith<$Res> get city;
}

/// @nodoc
class __$$ForecastImplCopyWithImpl<$Res>
    extends _$ForecastCopyWithImpl<$Res, _$ForecastImpl>
    implements _$$ForecastImplCopyWith<$Res> {
  __$$ForecastImplCopyWithImpl(
    _$ForecastImpl _value,
    $Res Function(_$ForecastImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Forecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? list = null, Object? city = null}) {
    return _then(
      _$ForecastImpl(
        list:
            null == list
                ? _value._list
                : list // ignore: cast_nullable_to_non_nullable
                    as List<Weather>,
        city:
            null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as CityInfo,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForecastImpl implements _Forecast {
  _$ForecastImpl({required final List<Weather> list, required this.city})
    : _list = list;

  factory _$ForecastImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastImplFromJson(json);

  final List<Weather> _list;
  @override
  List<Weather> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final CityInfo city;

  @override
  String toString() {
    return 'Forecast(list: $list, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_list),
    city,
  );

  /// Create a copy of Forecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastImplCopyWith<_$ForecastImpl> get copyWith =>
      __$$ForecastImplCopyWithImpl<_$ForecastImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForecastImplToJson(this);
  }
}

abstract class _Forecast implements Forecast {
  factory _Forecast({
    required final List<Weather> list,
    required final CityInfo city,
  }) = _$ForecastImpl;

  factory _Forecast.fromJson(Map<String, dynamic> json) =
      _$ForecastImpl.fromJson;

  @override
  List<Weather> get list;
  @override
  CityInfo get city;

  /// Create a copy of Forecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForecastImplCopyWith<_$ForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CityInfo _$CityInfoFromJson(Map<String, dynamic> json) {
  return _CityInfo.fromJson(json);
}

/// @nodoc
mixin _$CityInfo {
  String get name => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  int get sunrise => throw _privateConstructorUsedError;
  int get sunset => throw _privateConstructorUsedError;

  /// Serializes this CityInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CityInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityInfoCopyWith<CityInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityInfoCopyWith<$Res> {
  factory $CityInfoCopyWith(CityInfo value, $Res Function(CityInfo) then) =
      _$CityInfoCopyWithImpl<$Res, CityInfo>;
  @useResult
  $Res call({String name, String country, int sunrise, int sunset});
}

/// @nodoc
class _$CityInfoCopyWithImpl<$Res, $Val extends CityInfo>
    implements $CityInfoCopyWith<$Res> {
  _$CityInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? country = null,
    Object? sunrise = null,
    Object? sunset = null,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            country:
                null == country
                    ? _value.country
                    : country // ignore: cast_nullable_to_non_nullable
                        as String,
            sunrise:
                null == sunrise
                    ? _value.sunrise
                    : sunrise // ignore: cast_nullable_to_non_nullable
                        as int,
            sunset:
                null == sunset
                    ? _value.sunset
                    : sunset // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CityInfoImplCopyWith<$Res>
    implements $CityInfoCopyWith<$Res> {
  factory _$$CityInfoImplCopyWith(
    _$CityInfoImpl value,
    $Res Function(_$CityInfoImpl) then,
  ) = __$$CityInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String country, int sunrise, int sunset});
}

/// @nodoc
class __$$CityInfoImplCopyWithImpl<$Res>
    extends _$CityInfoCopyWithImpl<$Res, _$CityInfoImpl>
    implements _$$CityInfoImplCopyWith<$Res> {
  __$$CityInfoImplCopyWithImpl(
    _$CityInfoImpl _value,
    $Res Function(_$CityInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CityInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? country = null,
    Object? sunrise = null,
    Object? sunset = null,
  }) {
    return _then(
      _$CityInfoImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        country:
            null == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                    as String,
        sunrise:
            null == sunrise
                ? _value.sunrise
                : sunrise // ignore: cast_nullable_to_non_nullable
                    as int,
        sunset:
            null == sunset
                ? _value.sunset
                : sunset // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CityInfoImpl implements _CityInfo {
  _$CityInfoImpl({
    required this.name,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory _$CityInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityInfoImplFromJson(json);

  @override
  final String name;
  @override
  final String country;
  @override
  final int sunrise;
  @override
  final int sunset;

  @override
  String toString() {
    return 'CityInfo(name: $name, country: $country, sunrise: $sunrise, sunset: $sunset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.sunset, sunset) || other.sunset == sunset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, country, sunrise, sunset);

  /// Create a copy of CityInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityInfoImplCopyWith<_$CityInfoImpl> get copyWith =>
      __$$CityInfoImplCopyWithImpl<_$CityInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityInfoImplToJson(this);
  }
}

abstract class _CityInfo implements CityInfo {
  factory _CityInfo({
    required final String name,
    required final String country,
    required final int sunrise,
    required final int sunset,
  }) = _$CityInfoImpl;

  factory _CityInfo.fromJson(Map<String, dynamic> json) =
      _$CityInfoImpl.fromJson;

  @override
  String get name;
  @override
  String get country;
  @override
  int get sunrise;
  @override
  int get sunset;

  /// Create a copy of CityInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityInfoImplCopyWith<_$CityInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
