import 'package:flutter/material.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/models/forecast/forecast_data.dart';
import 'package:weather_app/src/repository/weather_repository.dart';
import 'package:weather_app/src/trents/city_trent.dart';

class ForecastTrent extends Trent<ForecastState> {
  final WeatherRepository _weatherRepository;

  ForecastTrent(this._weatherRepository) : super(ForecastEmpty()) {
    _startListening();
  }

  void _startListening() {
    get<CityTrent>().stateStream.listen((status) {
      if (status is CityLoaded) {
        _fetchForecastInfo(status.city);
      } else if (status is CityLoading) {
        emit(ForecastLoading());
      }
    });
  }

  void _fetchForecastInfo(String city) async {
    debugPrint("ForecastTrent: Fetching forecast info from weatherRepository");
    emit(ForecastLoading());

    try {
      final forecast = await _weatherRepository.getForecast(city: city);
      emit(ForecastLoaded(ForecastData.from(forecast)));
    } catch (e) {
      debugPrint("ForecastTrent: Error fetching weather info: $e");
      emit(ForecastError('$e'));
    }
  }
}

abstract class ForecastState extends EquatableCopyable<ForecastState> {}

class ForecastEmpty extends ForecastState {
  @override
  List<Object?> get props => [];

  @override
  ForecastState copyWith() {
    return this;
  }
}

class ForecastLoading extends ForecastState {
  @override
  List<Object?> get props => [];

  @override
  ForecastState copyWith() {
    return this;
  }
}

class ForecastLoaded extends ForecastState {
  final ForecastData data;

  ForecastLoaded(this.data);
  @override
  List<Object?> get props => [data];

  @override
  ForecastState copyWith({ForecastData? w}) {
    return ForecastLoaded(w ?? data);
  }
}

class ForecastError extends ForecastState {
  final String err;

  ForecastError(this.err);
  @override
  List<Object?> get props => [err];

  @override
  ForecastState copyWith({String? w}) {
    return ForecastError(w ?? err);
  }
}
