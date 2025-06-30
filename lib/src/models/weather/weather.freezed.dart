// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WeatherParams _$WeatherParamsFromJson(Map<String, dynamic> json) {
  return _WeatherParams.fromJson(json);
}

/// @nodoc
mixin _$WeatherParams {
  double get temp => throw _privateConstructorUsedError;
  double get humidity => throw _privateConstructorUsedError;
  @JsonKey(name: 'feels_like')
  double get feelsLike => throw _privateConstructorUsedError;

  /// Serializes this WeatherParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherParamsCopyWith<WeatherParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherParamsCopyWith<$Res> {
  factory $WeatherParamsCopyWith(
    WeatherParams value,
    $Res Function(WeatherParams) then,
  ) = _$WeatherParamsCopyWithImpl<$Res, WeatherParams>;
  @useResult
  $Res call({
    double temp,
    double humidity,
    @JsonKey(name: 'feels_like') double feelsLike,
  });
}

/// @nodoc
class _$WeatherParamsCopyWithImpl<$Res, $Val extends WeatherParams>
    implements $WeatherParamsCopyWith<$Res> {
  _$WeatherParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? humidity = null,
    Object? feelsLike = null,
  }) {
    return _then(
      _value.copyWith(
            temp:
                null == temp
                    ? _value.temp
                    : temp // ignore: cast_nullable_to_non_nullable
                        as double,
            humidity:
                null == humidity
                    ? _value.humidity
                    : humidity // ignore: cast_nullable_to_non_nullable
                        as double,
            feelsLike:
                null == feelsLike
                    ? _value.feelsLike
                    : feelsLike // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeatherParamsImplCopyWith<$Res>
    implements $WeatherParamsCopyWith<$Res> {
  factory _$$WeatherParamsImplCopyWith(
    _$WeatherParamsImpl value,
    $Res Function(_$WeatherParamsImpl) then,
  ) = __$$WeatherParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double temp,
    double humidity,
    @JsonKey(name: 'feels_like') double feelsLike,
  });
}

/// @nodoc
class __$$WeatherParamsImplCopyWithImpl<$Res>
    extends _$WeatherParamsCopyWithImpl<$Res, _$WeatherParamsImpl>
    implements _$$WeatherParamsImplCopyWith<$Res> {
  __$$WeatherParamsImplCopyWithImpl(
    _$WeatherParamsImpl _value,
    $Res Function(_$WeatherParamsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? humidity = null,
    Object? feelsLike = null,
  }) {
    return _then(
      _$WeatherParamsImpl(
        temp:
            null == temp
                ? _value.temp
                : temp // ignore: cast_nullable_to_non_nullable
                    as double,
        humidity:
            null == humidity
                ? _value.humidity
                : humidity // ignore: cast_nullable_to_non_nullable
                    as double,
        feelsLike:
            null == feelsLike
                ? _value.feelsLike
                : feelsLike // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherParamsImpl implements _WeatherParams {
  _$WeatherParamsImpl({
    required this.temp,
    required this.humidity,
    @JsonKey(name: 'feels_like') required this.feelsLike,
  });

  factory _$WeatherParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherParamsImplFromJson(json);

  @override
  final double temp;
  @override
  final double humidity;
  @override
  @JsonKey(name: 'feels_like')
  final double feelsLike;

  @override
  String toString() {
    return 'WeatherParams(temp: $temp, humidity: $humidity, feelsLike: $feelsLike)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherParamsImpl &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.feelsLike, feelsLike) ||
                other.feelsLike == feelsLike));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, temp, humidity, feelsLike);

  /// Create a copy of WeatherParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherParamsImplCopyWith<_$WeatherParamsImpl> get copyWith =>
      __$$WeatherParamsImplCopyWithImpl<_$WeatherParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherParamsImplToJson(this);
  }
}

abstract class _WeatherParams implements WeatherParams {
  factory _WeatherParams({
    required final double temp,
    required final double humidity,
    @JsonKey(name: 'feels_like') required final double feelsLike,
  }) = _$WeatherParamsImpl;

  factory _WeatherParams.fromJson(Map<String, dynamic> json) =
      _$WeatherParamsImpl.fromJson;

  @override
  double get temp;
  @override
  double get humidity;
  @override
  @JsonKey(name: 'feels_like')
  double get feelsLike;

  /// Create a copy of WeatherParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherParamsImplCopyWith<_$WeatherParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) {
  return _WeatherInfo.fromJson(json);
}

/// @nodoc
mixin _$WeatherInfo {
  String get main => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this WeatherInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherInfoCopyWith<WeatherInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherInfoCopyWith<$Res> {
  factory $WeatherInfoCopyWith(
    WeatherInfo value,
    $Res Function(WeatherInfo) then,
  ) = _$WeatherInfoCopyWithImpl<$Res, WeatherInfo>;
  @useResult
  $Res call({String main, String description});
}

/// @nodoc
class _$WeatherInfoCopyWithImpl<$Res, $Val extends WeatherInfo>
    implements $WeatherInfoCopyWith<$Res> {
  _$WeatherInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? main = null, Object? description = null}) {
    return _then(
      _value.copyWith(
            main:
                null == main
                    ? _value.main
                    : main // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeatherInfoImplCopyWith<$Res>
    implements $WeatherInfoCopyWith<$Res> {
  factory _$$WeatherInfoImplCopyWith(
    _$WeatherInfoImpl value,
    $Res Function(_$WeatherInfoImpl) then,
  ) = __$$WeatherInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String main, String description});
}

/// @nodoc
class __$$WeatherInfoImplCopyWithImpl<$Res>
    extends _$WeatherInfoCopyWithImpl<$Res, _$WeatherInfoImpl>
    implements _$$WeatherInfoImplCopyWith<$Res> {
  __$$WeatherInfoImplCopyWithImpl(
    _$WeatherInfoImpl _value,
    $Res Function(_$WeatherInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? main = null, Object? description = null}) {
    return _then(
      _$WeatherInfoImpl(
        main:
            null == main
                ? _value.main
                : main // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherInfoImpl implements _WeatherInfo {
  _$WeatherInfoImpl({required this.main, required this.description});

  factory _$WeatherInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherInfoImplFromJson(json);

  @override
  final String main;
  @override
  final String description;

  @override
  String toString() {
    return 'WeatherInfo(main: $main, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherInfoImpl &&
            (identical(other.main, main) || other.main == main) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, main, description);

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherInfoImplCopyWith<_$WeatherInfoImpl> get copyWith =>
      __$$WeatherInfoImplCopyWithImpl<_$WeatherInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherInfoImplToJson(this);
  }
}

abstract class _WeatherInfo implements WeatherInfo {
  factory _WeatherInfo({
    required final String main,
    required final String description,
  }) = _$WeatherInfoImpl;

  factory _WeatherInfo.fromJson(Map<String, dynamic> json) =
      _$WeatherInfoImpl.fromJson;

  @override
  String get main;
  @override
  String get description;

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherInfoImplCopyWith<_$WeatherInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WindInfo _$WindInfoFromJson(Map<String, dynamic> json) {
  return _WindInfo.fromJson(json);
}

/// @nodoc
mixin _$WindInfo {
  double get speed => throw _privateConstructorUsedError;

  /// Serializes this WindInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WindInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WindInfoCopyWith<WindInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WindInfoCopyWith<$Res> {
  factory $WindInfoCopyWith(WindInfo value, $Res Function(WindInfo) then) =
      _$WindInfoCopyWithImpl<$Res, WindInfo>;
  @useResult
  $Res call({double speed});
}

/// @nodoc
class _$WindInfoCopyWithImpl<$Res, $Val extends WindInfo>
    implements $WindInfoCopyWith<$Res> {
  _$WindInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WindInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? speed = null}) {
    return _then(
      _value.copyWith(
            speed:
                null == speed
                    ? _value.speed
                    : speed // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WindInfoImplCopyWith<$Res>
    implements $WindInfoCopyWith<$Res> {
  factory _$$WindInfoImplCopyWith(
    _$WindInfoImpl value,
    $Res Function(_$WindInfoImpl) then,
  ) = __$$WindInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double speed});
}

/// @nodoc
class __$$WindInfoImplCopyWithImpl<$Res>
    extends _$WindInfoCopyWithImpl<$Res, _$WindInfoImpl>
    implements _$$WindInfoImplCopyWith<$Res> {
  __$$WindInfoImplCopyWithImpl(
    _$WindInfoImpl _value,
    $Res Function(_$WindInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WindInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? speed = null}) {
    return _then(
      _$WindInfoImpl(
        speed:
            null == speed
                ? _value.speed
                : speed // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WindInfoImpl implements _WindInfo {
  _$WindInfoImpl({required this.speed});

  factory _$WindInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WindInfoImplFromJson(json);

  @override
  final double speed;

  @override
  String toString() {
    return 'WindInfo(speed: $speed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WindInfoImpl &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, speed);

  /// Create a copy of WindInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WindInfoImplCopyWith<_$WindInfoImpl> get copyWith =>
      __$$WindInfoImplCopyWithImpl<_$WindInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WindInfoImplToJson(this);
  }
}

abstract class _WindInfo implements WindInfo {
  factory _WindInfo({required final double speed}) = _$WindInfoImpl;

  factory _WindInfo.fromJson(Map<String, dynamic> json) =
      _$WindInfoImpl.fromJson;

  @override
  double get speed;

  /// Create a copy of WindInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WindInfoImplCopyWith<_$WindInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
mixin _$Weather {
  @JsonKey(name: 'main')
  WeatherParams get weatherParams => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather')
  List<WeatherInfo> get weatherInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind')
  WindInfo get windInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'pop')
  double get rainProbability => throw _privateConstructorUsedError;
  int get dt => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get cityName => throw _privateConstructorUsedError;
  SysInfo get sys => throw _privateConstructorUsedError;

  /// Serializes this Weather to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res, Weather>;
  @useResult
  $Res call({
    @JsonKey(name: 'main') WeatherParams weatherParams,
    @JsonKey(name: 'weather') List<WeatherInfo> weatherInfo,
    @JsonKey(name: 'wind') WindInfo windInfo,
    @JsonKey(name: 'pop') double rainProbability,
    int dt,
    @JsonKey(name: 'name') String? cityName,
    SysInfo sys,
  });

  $WeatherParamsCopyWith<$Res> get weatherParams;
  $WindInfoCopyWith<$Res> get windInfo;
  $SysInfoCopyWith<$Res> get sys;
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res, $Val extends Weather>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherParams = null,
    Object? weatherInfo = null,
    Object? windInfo = null,
    Object? rainProbability = null,
    Object? dt = null,
    Object? cityName = freezed,
    Object? sys = null,
  }) {
    return _then(
      _value.copyWith(
            weatherParams:
                null == weatherParams
                    ? _value.weatherParams
                    : weatherParams // ignore: cast_nullable_to_non_nullable
                        as WeatherParams,
            weatherInfo:
                null == weatherInfo
                    ? _value.weatherInfo
                    : weatherInfo // ignore: cast_nullable_to_non_nullable
                        as List<WeatherInfo>,
            windInfo:
                null == windInfo
                    ? _value.windInfo
                    : windInfo // ignore: cast_nullable_to_non_nullable
                        as WindInfo,
            rainProbability:
                null == rainProbability
                    ? _value.rainProbability
                    : rainProbability // ignore: cast_nullable_to_non_nullable
                        as double,
            dt:
                null == dt
                    ? _value.dt
                    : dt // ignore: cast_nullable_to_non_nullable
                        as int,
            cityName:
                freezed == cityName
                    ? _value.cityName
                    : cityName // ignore: cast_nullable_to_non_nullable
                        as String?,
            sys:
                null == sys
                    ? _value.sys
                    : sys // ignore: cast_nullable_to_non_nullable
                        as SysInfo,
          )
          as $Val,
    );
  }

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherParamsCopyWith<$Res> get weatherParams {
    return $WeatherParamsCopyWith<$Res>(_value.weatherParams, (value) {
      return _then(_value.copyWith(weatherParams: value) as $Val);
    });
  }

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WindInfoCopyWith<$Res> get windInfo {
    return $WindInfoCopyWith<$Res>(_value.windInfo, (value) {
      return _then(_value.copyWith(windInfo: value) as $Val);
    });
  }

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SysInfoCopyWith<$Res> get sys {
    return $SysInfoCopyWith<$Res>(_value.sys, (value) {
      return _then(_value.copyWith(sys: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherImplCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$WeatherImplCopyWith(
    _$WeatherImpl value,
    $Res Function(_$WeatherImpl) then,
  ) = __$$WeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'main') WeatherParams weatherParams,
    @JsonKey(name: 'weather') List<WeatherInfo> weatherInfo,
    @JsonKey(name: 'wind') WindInfo windInfo,
    @JsonKey(name: 'pop') double rainProbability,
    int dt,
    @JsonKey(name: 'name') String? cityName,
    SysInfo sys,
  });

  @override
  $WeatherParamsCopyWith<$Res> get weatherParams;
  @override
  $WindInfoCopyWith<$Res> get windInfo;
  @override
  $SysInfoCopyWith<$Res> get sys;
}

/// @nodoc
class __$$WeatherImplCopyWithImpl<$Res>
    extends _$WeatherCopyWithImpl<$Res, _$WeatherImpl>
    implements _$$WeatherImplCopyWith<$Res> {
  __$$WeatherImplCopyWithImpl(
    _$WeatherImpl _value,
    $Res Function(_$WeatherImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherParams = null,
    Object? weatherInfo = null,
    Object? windInfo = null,
    Object? rainProbability = null,
    Object? dt = null,
    Object? cityName = freezed,
    Object? sys = null,
  }) {
    return _then(
      _$WeatherImpl(
        weatherParams:
            null == weatherParams
                ? _value.weatherParams
                : weatherParams // ignore: cast_nullable_to_non_nullable
                    as WeatherParams,
        weatherInfo:
            null == weatherInfo
                ? _value._weatherInfo
                : weatherInfo // ignore: cast_nullable_to_non_nullable
                    as List<WeatherInfo>,
        windInfo:
            null == windInfo
                ? _value.windInfo
                : windInfo // ignore: cast_nullable_to_non_nullable
                    as WindInfo,
        rainProbability:
            null == rainProbability
                ? _value.rainProbability
                : rainProbability // ignore: cast_nullable_to_non_nullable
                    as double,
        dt:
            null == dt
                ? _value.dt
                : dt // ignore: cast_nullable_to_non_nullable
                    as int,
        cityName:
            freezed == cityName
                ? _value.cityName
                : cityName // ignore: cast_nullable_to_non_nullable
                    as String?,
        sys:
            null == sys
                ? _value.sys
                : sys // ignore: cast_nullable_to_non_nullable
                    as SysInfo,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherImpl implements _Weather {
  _$WeatherImpl({
    @JsonKey(name: 'main') required this.weatherParams,
    @JsonKey(name: 'weather') required final List<WeatherInfo> weatherInfo,
    @JsonKey(name: 'wind') required this.windInfo,
    @JsonKey(name: 'pop') this.rainProbability = 0,
    required this.dt,
    @JsonKey(name: 'name') this.cityName,
    required this.sys,
  }) : _weatherInfo = weatherInfo;

  factory _$WeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherImplFromJson(json);

  @override
  @JsonKey(name: 'main')
  final WeatherParams weatherParams;
  final List<WeatherInfo> _weatherInfo;
  @override
  @JsonKey(name: 'weather')
  List<WeatherInfo> get weatherInfo {
    if (_weatherInfo is EqualUnmodifiableListView) return _weatherInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weatherInfo);
  }

  @override
  @JsonKey(name: 'wind')
  final WindInfo windInfo;
  @override
  @JsonKey(name: 'pop')
  final double rainProbability;
  @override
  final int dt;
  @override
  @JsonKey(name: 'name')
  final String? cityName;
  @override
  final SysInfo sys;

  @override
  String toString() {
    return 'Weather(weatherParams: $weatherParams, weatherInfo: $weatherInfo, windInfo: $windInfo, rainProbability: $rainProbability, dt: $dt, cityName: $cityName, sys: $sys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherImpl &&
            (identical(other.weatherParams, weatherParams) ||
                other.weatherParams == weatherParams) &&
            const DeepCollectionEquality().equals(
              other._weatherInfo,
              _weatherInfo,
            ) &&
            (identical(other.windInfo, windInfo) ||
                other.windInfo == windInfo) &&
            (identical(other.rainProbability, rainProbability) ||
                other.rainProbability == rainProbability) &&
            (identical(other.dt, dt) || other.dt == dt) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.sys, sys) || other.sys == sys));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    weatherParams,
    const DeepCollectionEquality().hash(_weatherInfo),
    windInfo,
    rainProbability,
    dt,
    cityName,
    sys,
  );

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      __$$WeatherImplCopyWithImpl<_$WeatherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherImplToJson(this);
  }
}

abstract class _Weather implements Weather {
  factory _Weather({
    @JsonKey(name: 'main') required final WeatherParams weatherParams,
    @JsonKey(name: 'weather') required final List<WeatherInfo> weatherInfo,
    @JsonKey(name: 'wind') required final WindInfo windInfo,
    @JsonKey(name: 'pop') final double rainProbability,
    required final int dt,
    @JsonKey(name: 'name') final String? cityName,
    required final SysInfo sys,
  }) = _$WeatherImpl;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$WeatherImpl.fromJson;

  @override
  @JsonKey(name: 'main')
  WeatherParams get weatherParams;
  @override
  @JsonKey(name: 'weather')
  List<WeatherInfo> get weatherInfo;
  @override
  @JsonKey(name: 'wind')
  WindInfo get windInfo;
  @override
  @JsonKey(name: 'pop')
  double get rainProbability;
  @override
  int get dt;
  @override
  @JsonKey(name: 'name')
  String? get cityName;
  @override
  SysInfo get sys;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SysInfo _$SysInfoFromJson(Map<String, dynamic> json) {
  return _SysInfo.fromJson(json);
}

/// @nodoc
mixin _$SysInfo {
  int get sunrise => throw _privateConstructorUsedError;
  int get sunset => throw _privateConstructorUsedError;
  dynamic get country => throw _privateConstructorUsedError;

  /// Serializes this SysInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SysInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SysInfoCopyWith<SysInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SysInfoCopyWith<$Res> {
  factory $SysInfoCopyWith(SysInfo value, $Res Function(SysInfo) then) =
      _$SysInfoCopyWithImpl<$Res, SysInfo>;
  @useResult
  $Res call({int sunrise, int sunset, dynamic country});
}

/// @nodoc
class _$SysInfoCopyWithImpl<$Res, $Val extends SysInfo>
    implements $SysInfoCopyWith<$Res> {
  _$SysInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SysInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sunrise = null,
    Object? sunset = null,
    Object? country = freezed,
  }) {
    return _then(
      _value.copyWith(
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
            country:
                freezed == country
                    ? _value.country
                    : country // ignore: cast_nullable_to_non_nullable
                        as dynamic,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SysInfoImplCopyWith<$Res> implements $SysInfoCopyWith<$Res> {
  factory _$$SysInfoImplCopyWith(
    _$SysInfoImpl value,
    $Res Function(_$SysInfoImpl) then,
  ) = __$$SysInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int sunrise, int sunset, dynamic country});
}

/// @nodoc
class __$$SysInfoImplCopyWithImpl<$Res>
    extends _$SysInfoCopyWithImpl<$Res, _$SysInfoImpl>
    implements _$$SysInfoImplCopyWith<$Res> {
  __$$SysInfoImplCopyWithImpl(
    _$SysInfoImpl _value,
    $Res Function(_$SysInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SysInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sunrise = null,
    Object? sunset = null,
    Object? country = freezed,
  }) {
    return _then(
      _$SysInfoImpl(
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
        country: freezed == country ? _value.country! : country,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SysInfoImpl implements _SysInfo {
  _$SysInfoImpl({this.sunrise = 0, this.sunset = 0, this.country = "N/A"});

  factory _$SysInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SysInfoImplFromJson(json);

  @override
  @JsonKey()
  final int sunrise;
  @override
  @JsonKey()
  final int sunset;
  @override
  @JsonKey()
  final dynamic country;

  @override
  String toString() {
    return 'SysInfo(sunrise: $sunrise, sunset: $sunset, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SysInfoImpl &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.sunset, sunset) || other.sunset == sunset) &&
            const DeepCollectionEquality().equals(other.country, country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sunrise,
    sunset,
    const DeepCollectionEquality().hash(country),
  );

  /// Create a copy of SysInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SysInfoImplCopyWith<_$SysInfoImpl> get copyWith =>
      __$$SysInfoImplCopyWithImpl<_$SysInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SysInfoImplToJson(this);
  }
}

abstract class _SysInfo implements SysInfo {
  factory _SysInfo({
    final int sunrise,
    final int sunset,
    final dynamic country,
  }) = _$SysInfoImpl;

  factory _SysInfo.fromJson(Map<String, dynamic> json) = _$SysInfoImpl.fromJson;

  @override
  int get sunrise;
  @override
  int get sunset;
  @override
  dynamic get country;

  /// Create a copy of SysInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SysInfoImplCopyWith<_$SysInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
