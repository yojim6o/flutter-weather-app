// weather_state.dart
import 'package:trent/trent.dart';
import 'package:weather_app/src/models/weather_model.dart';

abstract class WeatherState extends EquatableCopyable<WeatherState> {
  WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {
  @override
  WeatherState copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }
}

class WeatherLoading extends WeatherState {
  @override
  WeatherState copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }
}

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;

  WeatherLoaded({required this.weather});

  @override
  List<Object?> get props => [weather];

  @override
  WeatherState copyWith({WeatherModel? weatherModel}) {
    return WeatherLoaded(weather: weatherModel ?? weather);
  }
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);

  @override
  List<Object?> get props => [message];

  @override
  WeatherState copyWith({String? message}) {
    return WeatherError(message ?? this.message);
  }
}
