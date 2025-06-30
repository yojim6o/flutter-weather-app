import 'package:trent/trent.dart';
import 'package:weather_app/src/models/weather/weather_data.dart';

class ForecastCardTrent extends Trent<ForecastCardState> {
  ForecastCardTrent() : super(ForecastEmpty());

  void addWeatherItem(List<WeatherData> data) {
    emit(ForecastItemLoaded(data.first));
  }
}

abstract class ForecastCardState extends EquatableCopyable<ForecastCardState> {}

class ForecastEmpty extends ForecastCardState {
  @override
  List<Object?> get props => [];

  @override
  ForecastCardState copyWith() {
    return this;
  }
}

class ForecastItemLoaded extends ForecastCardState {
  final WeatherData data;

  ForecastItemLoaded(this.data);
  @override
  List<Object?> get props => [data];

  @override
  ForecastCardState copyWith({WeatherData? w}) {
    return ForecastItemLoaded(w ?? data);
  }
}

class ForecastCardError extends ForecastCardState {
  final String err;

  ForecastCardError(this.err);
  @override
  List<Object?> get props => [err];

  @override
  ForecastCardState copyWith({String? w}) {
    return ForecastCardError(w ?? err);
  }
}
