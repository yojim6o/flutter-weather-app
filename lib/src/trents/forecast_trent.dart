import 'package:trent/trent.dart';
import 'package:weather_app/src/models/weather_model.dart';

class ForecastTrent extends Trent<ForecastState> {
  ForecastTrent() : super(ForecastEmpty());

  void addForecastList(List<ForecastItem> list) {
    emit(ForecastLoaded(list.first));
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

class ForecastLoaded extends ForecastState {
  final ForecastItem forecastItem;

  ForecastLoaded(this.forecastItem);
  @override
  List<Object?> get props => [forecastItem];

  @override
  ForecastState copyWith({ForecastItem? i}) {
    return ForecastLoaded(i ?? forecastItem);
  }
}
