import 'package:trent/trent.dart';
import 'package:weather_app/src/models/weather/weather_data.dart';

abstract class WeatherState extends EquatableCopyable<WeatherState> {
  WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {
  @override
  WeatherState copyWith() {
    return this;
  }
}

class WeatherLoading extends WeatherState {
  @override
  WeatherState copyWith() {
    return this;
  }
}

class WeatherLoaded extends WeatherState {
  final WeatherData data;

  WeatherLoaded({required this.data});

  @override
  List<Object?> get props => [data];

  @override
  WeatherState copyWith({WeatherData? w}) {
    return WeatherLoaded(data: w ?? data);
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
