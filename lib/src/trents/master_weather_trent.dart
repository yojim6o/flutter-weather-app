import 'package:rxdart/rxdart.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/trents/forecast_trent.dart';
import 'package:weather_app/src/trents/states/weather_state.dart';
import 'package:weather_app/src/trents/weather_trent.dart';

class MasterWeatherTrent extends Trent<MasterWeatherState> {
  MasterWeatherTrent() : super(MaserWeatherLoading()) {
    _startListening();
  }

  void _startListening() {
    Rx.combineLatest2(
      get<WeatherTrent>().stateStream,
      get<ForecastTrent>().stateStream,
      (WeatherState w, ForecastState f) {
        if (w is WeatherLoaded && f is ForecastLoaded) {
          return true;
        }
        return false;
      },
    ).listen((value) {
      if (value) {
        emit(MaserWeatherLoaded());
      }
    });
  }
}

abstract class MasterWeatherState
    extends EquatableCopyable<MasterWeatherState> {}

class MaserWeatherLoading extends MasterWeatherState {
  @override
  MasterWeatherState copyWith() {
    return this;
  }

  @override
  List<Object?> get props => [];
}

class MaserWeatherLoaded extends MasterWeatherState {
  MaserWeatherLoaded();
  @override
  MasterWeatherState copyWith() {
    return MaserWeatherLoaded();
  }

  @override
  List<Object?> get props => [];
}
